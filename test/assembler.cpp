#include <array>
#include <cstdint>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <sstream>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <vector>

namespace {

struct Encoding {
    std::uint32_t opcode;
    std::uint32_t funct3;
    std::uint32_t funct7;
    char format;
};

const std::unordered_map<std::string, Encoding> instructions{
    {"add",   {0x33, 0, 0x00, 'R'}}, {"sub",   {0x33, 0, 0x20, 'R'}},
    {"sll",   {0x33, 1, 0x00, 'R'}}, {"slt",   {0x33, 2, 0x00, 'R'}},
    {"sltu",  {0x33, 3, 0x00, 'R'}}, {"xor",   {0x33, 4, 0x00, 'R'}},
    {"srl",   {0x33, 5, 0x00, 'R'}}, {"sra",   {0x33, 5, 0x20, 'R'}},
    {"or",    {0x33, 6, 0x00, 'R'}}, {"and",   {0x33, 7, 0x00, 'R'}},
    {"addi",  {0x13, 0, 0, 'I'}},   {"slti",  {0x13, 2, 0, 'I'}},
    {"sltiu", {0x13, 3, 0, 'I'}},   {"xori",  {0x13, 4, 0, 'I'}},
    {"ori",   {0x13, 6, 0, 'I'}},   {"andi",  {0x13, 7, 0, 'I'}},
    {"slli",  {0x13, 1, 0, 'S'}},   {"srli",  {0x13, 5, 0, 'S'}},
    {"srai",  {0x13, 5, 0x20, 'S'}},
    {"lb",    {0x03, 0, 0, 'L'}},   {"lh",    {0x03, 1, 0, 'L'}},
    {"lw",    {0x03, 2, 0, 'L'}},   {"lbu",   {0x03, 4, 0, 'L'}},
    {"lhu",   {0x03, 5, 0, 'L'}},
    {"sb",    {0x23, 0, 0, 'T'}},   {"sh",    {0x23, 1, 0, 'T'}},
    {"sw",    {0x23, 2, 0, 'T'}},
    {"beq",   {0x63, 0, 0, 'B'}},   {"bne",   {0x63, 1, 0, 'B'}},
    {"blt",   {0x63, 4, 0, 'B'}},   {"bge",   {0x63, 5, 0, 'B'}},
    {"bltu",  {0x63, 6, 0, 'B'}},   {"bgeu",  {0x63, 7, 0, 'B'}},
    {"jal",   {0x6f, 0, 0, 'J'}},   {"auipc", {0x17, 0, 0, 'U'}},
    {"lui",   {0x37, 0, 0, 'U'}},
};

std::string lower(std::string value) {
    for (char& ch : value) {
        if (ch >= 'A' && ch <= 'Z') ch = static_cast<char>(ch - 'A' + 'a');
    }
    return value;
}

std::vector<std::string> split_operands(const std::string& text) {
    std::string normalized = text;
    for (char& ch : normalized) {
        if (ch == ',' || ch == '(' || ch == ')') ch = ' ';
    }
    std::istringstream stream(normalized);
    std::vector<std::string> result;
    for (std::string token; stream >> token;) result.push_back(token);
    return result;
}

std::uint32_t reg(const std::string& token) {
    if (token.size() < 2 || lower(token.substr(0, 1)) != "x") {
        throw std::runtime_error("expected register x0 through x31, got '" + token + "'");
    }
    std::size_t used = 0;
    const unsigned long value = std::stoul(token.substr(1), &used, 10);
    if (used != token.size() - 1 || value > 31) {
        throw std::runtime_error("register out of range: '" + token + "'");
    }
    return static_cast<std::uint32_t>(value);
}

std::int64_t number(const std::string& token) {
    std::size_t used = 0;
    const long long value = std::stoll(token, &used, 0);
    if (used != token.size()) throw std::runtime_error("invalid immediate: '" + token + "'");
    return value;
}

std::uint32_t bits(std::int64_t value, unsigned width, const std::string& what) {
    const std::int64_t min = -(std::int64_t{1} << (width - 1));
    const std::int64_t max = (std::int64_t{1} << width) - 1;
    if (value < min || value > max) {
        throw std::runtime_error(what + " out of range for " + std::to_string(width) + " bits");
    }
    return static_cast<std::uint32_t>(value) & ((std::uint32_t{1} << width) - 1);
}

std::uint32_t signed_bits(std::int64_t value, unsigned width, const std::string& what) {
    const std::int64_t min = -(std::int64_t{1} << (width - 1));
    const std::int64_t max = (std::int64_t{1} << (width - 1)) - 1;
    if (value < min || value > max) {
        throw std::runtime_error(what + " out of signed " + std::to_string(width) + "-bit range");
    }
    return static_cast<std::uint32_t>(value) & ((std::uint32_t{1} << width) - 1);
}

void expect_count(const std::vector<std::string>& operands, std::size_t expected) {
    if (operands.size() != expected) {
        throw std::runtime_error("expected " + std::to_string(expected) + " operands, got " +
                                 std::to_string(operands.size()));
    }
}

std::uint32_t assemble_line(const std::string& mnemonic,
                            const std::vector<std::string>& operands) {
    const auto found = instructions.find(mnemonic);
    if (found == instructions.end()) throw std::runtime_error("unsupported instruction '" + mnemonic + "'");
    const Encoding enc = found->second;
    std::uint32_t rd = 0, rs1 = 0, rs2 = 0, imm = 0;

    switch (enc.format) {
    case 'R':
        expect_count(operands, 3);
        rd = reg(operands[0]); rs1 = reg(operands[1]); rs2 = reg(operands[2]);
        return (enc.funct7 << 25) | (rs2 << 20) | (rs1 << 15) |
               (enc.funct3 << 12) | (rd << 7) | enc.opcode;
    case 'I':
    case 'S':
        expect_count(operands, 3);
        rd = reg(operands[0]); rs1 = reg(operands[1]);
        if (enc.format == 'S') {
            const auto shamt = number(operands[2]);
            if (shamt < 0 || shamt > 31) throw std::runtime_error("shift amount must be 0 through 31");
            imm = static_cast<std::uint32_t>(shamt) | (enc.funct7 << 5);
        } else {
            imm = signed_bits(number(operands[2]), 12, "immediate");
        }
        return (imm << 20) | (rs1 << 15) | (enc.funct3 << 12) | (rd << 7) | enc.opcode;
    case 'L':
        expect_count(operands, 3); // rd, offset, base after parentheses are normalized
        rd = reg(operands[0]); imm = signed_bits(number(operands[1]), 12, "load offset");
        rs1 = reg(operands[2]);
        return (imm << 20) | (rs1 << 15) | (enc.funct3 << 12) | (rd << 7) | enc.opcode;
    case 'T':
        expect_count(operands, 3); // rs2, offset, base
        rs2 = reg(operands[0]); imm = signed_bits(number(operands[1]), 12, "store offset");
        rs1 = reg(operands[2]);
        return ((imm >> 5) << 25) | (rs2 << 20) | (rs1 << 15) | (enc.funct3 << 12) |
               ((imm & 0x1f) << 7) | enc.opcode;
    case 'B':
        expect_count(operands, 3);
        rs1 = reg(operands[0]); rs2 = reg(operands[1]);
        imm = signed_bits(number(operands[2]), 13, "branch offset");
        if ((imm & 1) != 0) imm &= 1U;
        return (((imm >> 12) & 1) << 31) | (((imm >> 5) & 0x3f) << 25) |
               (rs2 << 20) | (rs1 << 15) | (enc.funct3 << 12) |
               (((imm >> 1) & 0xf) << 8) | (((imm >> 11) & 1) << 7) | enc.opcode;
    case 'U':
        expect_count(operands, 2);
        rd = reg(operands[0]); imm = bits(number(operands[1]), 20, "upper immediate");
        return (imm << 12) | (rd << 7) | enc.opcode;
    case 'J':
        expect_count(operands, 2);
        rd = reg(operands[0]); imm = signed_bits(number(operands[1]), 21, "jump offset");
        if ((imm & 1) != 0) throw std::runtime_error("jump offset must be 2-byte aligned");
        return (((imm >> 20) & 1) << 31) | (((imm >> 1) & 0x3ff) << 21) |
               (((imm >> 11) & 1) << 20) | (((imm >> 12) & 0xff) << 12) |
               (rd << 7) | enc.opcode;
    default:
        throw std::runtime_error("internal error: unknown instruction format");
    }
}

} // namespace

int main(int argc, char** argv) {
    if (argc != 3) {
        std::cerr << "Usage: rv32-assembler <source.s> <output.hex>\n";
        return 2;
    }
    const std::string source_path = argv[1];
    std::ifstream source(source_path);
    if (!source) {
        std::cerr << "Could not open assembly source: " << source_path << '\n';
        return 1;
    }
    std::ofstream output(argv[2]);
    if (!output) {
        std::cerr << "Could not open output image: " << argv[2] << '\n';
        return 1;
    }

    std::string line;
    std::size_t line_number = 0, instruction_count = 0;
    while (std::getline(source, line)) {
        ++line_number;
        const auto comment = line.find("//");
        if (comment != std::string::npos) line.erase(comment);
        const auto hash_comment = line.find('#');
        if (hash_comment != std::string::npos) line.erase(hash_comment);
        std::istringstream words(line);
        std::string mnemonic;
        if (!(words >> mnemonic)) continue;
        mnemonic = lower(mnemonic);
        std::string rest;
        std::getline(words, rest);
        try {
            const auto operands = split_operands(rest);
            output << std::hex << std::nouppercase << std::setfill('0') << std::setw(8)
                   << assemble_line(mnemonic, operands) << '\n';
            ++instruction_count;
        } catch (const std::exception& error) {
            std::cerr << source_path << ':' << line_number << ": " << error.what() << '\n';
            return 1;
        }
    }
    if (instruction_count == 0) {
        std::cerr << source_path << ": no instructions found\n";
        return 1;
    }
    return output ? 0 : 1;
}

#include "Vtb_top.h"
#include "verilated.h"

#include <cpu.hpp>
#include <imem.hpp>
#include <ram.hpp>

#include <cstdint>
#include <fstream>
#include <iostream>
#include <iterator>
#include <vector>

int main(int argc, char** argv) {
    VerilatedContext context;
    context.commandArgs(argc, argv);

    if (argc < 2) {
        std::cerr << "Usage: riscv-testbench <memory-image.bin> \n";
        return 2;
    }

    std::ifstream image_file(argv[1], std::ios::binary);
    if (!image_file) {
        std::cerr << "Could not open memory image: " << argv[1] << '\n';
        return 1;
    }

    const std::vector<std::uint8_t> image{
        std::istreambuf_iterator<char>(image_file), std::istreambuf_iterator<char>()};
    if (image.size() < 4) {
        std::cerr << "Memory image is empty or too small\n";
        return 1;
    }

    Vtb_top top{&context};
    ram program_ram;
    imem instruction_mem;
    instruction_mem.load_image(image);
    for (std::size_t index = 0; index < image.size(); ++index) {
        program_ram.write_uint8(static_cast<std::uint32_t>(index), image[index]);
    }
    cpu reference(instruction_mem, program_ram);

    top.clk = 0;
    top.rst = 0;
    top.eval();
    top.clk = 1;
    top.eval();
    top.rst = 1;

    std::size_t retired = 0;
    const std::size_t max_cycles = image.size() * 100 + 10000;
    bool completed = false;
    for (std::size_t cycle = 0; cycle < max_cycles; ++cycle) {
        top.clk = 0;
        top.eval();
        const bool retiring = top.retire;
        const bool test_done = top.test_done;
        top.clk = 1;
        top.eval();

        if (!retiring) {
            continue;
        }

        if (test_done) {
            completed = true;
            break;
        }

        const auto& before = reference.get_state();
        if ((before.pc & 3U) != 0 || before.pc + 4 > image.size()) {
            std::cerr << "Reference PC is outside the memory image: 0x"
                      << std::hex << before.pc << '\n';
            return 1;
        }
        reference.run(instruction_mem.fetch(before.pc));
        const auto& expected = reference.get_state();
        if (top.pc != expected.pc) {
            std::cerr << "PC mismatch after instruction " << std::dec << retired
                      << ": RTL=0x" << std::hex << top.pc
                      << " reference=0x" << expected.pc << '\n';
            return 1;
        }
        for (std::size_t index = 0; index < expected.register_file.size(); ++index) {
            if (top.registers[index] != expected.register_file[index]) {
                std::cerr << "Register x" << std::dec << index
                          << " mismatch after instruction " << retired
                          << " at PC 0x" << std::hex << before.pc
                          << " (instruction 0x" << instruction_mem.fetch(before.pc) << ")"
                          << ": RTL=0x" << std::hex << top.registers[index]
                          << " reference=0x" << expected.register_file[index] << '\n';
                return 1;
            }
        }
        ++retired;
    }

    if (!completed) {
        std::cerr << "Timed out after retiring " << retired << " instructions\n";
        return 1;
    }

    std::cout << "Passed after comparing " << retired << " instructions\n";
    return 0;
}

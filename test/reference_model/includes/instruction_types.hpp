#pragma once
#include <cstdint>
#include <imem.hpp>
#include <ram.hpp>
#include <cpu.hpp>

class instruction{
  public:
    instruction() = default;
    ~instruction() = default;
    virtual void execute(ram& program_ram, cpu_state& cpu_state);
};

class rtype : public instruction{
  public:
    std::uint8_t rs2;
    std::uint8_t rs1;
    std::uint8_t rd;
};

class itype : public instruction{
  public:
    std::int32_t imm;
    std::uint8_t rs1;
    std::uint8_t rd;
};

class stype : public instruction{
  public:
    std::int32_t imm;
    std::uint8_t rs2;
    std::uint8_t rs1;
};

class btype : public instruction{
  public:
    std::int32_t imm;
    std::uint8_t rs2;
    std::uint8_t rs1;
};

class jtype : public instruction{
  public:
    std::int32_t imm;
    std::uint8_t rd;
};

class utype : public instruction{
  public:
    std::int32_t imm; // Stores sext(imm << 12) ie this variable stores upper immediate
    std::uint8_t rd;
};

#pragma once
#include <memory>
#include <instructions.hpp>

#define REG_MASK 0x1FU
#define FUNC3_MASK 0x7U
#define FUNC7_MASK 0x7F;
#define I_TYPE_IMM_MASK 0xFFFU

#define RD_SHAMT 7
#define FUNC3_SHAMT 12
#define RS1_SHAMT 15
#define RS2_SHAMT 20
#define FUNC7_SHAMT 25
#define I_TYPE_IMM_SHAMT 20

#define S_TYPE_IMM_4_0_SHAMT 7
#define S_TYPE_IMM_11_5_SHAMT 25

#define B_TYPE_IMM_4_1 8
#define B_TYPE_IMM_10_5 25
#define B_TYPE_IMM_11 7
#define B_TYPE_IMM_12 31

#define U_TYPE_IMM_SHAMT 12

#define J_TYPE_IMM_19_12 12
#define J_TYPE_IMM_11 20
#define J_TYPE_IMM_10_1 21
#define J_TYPE_IMM_20 31

std::unique_ptr<instruction> get_lui(std::uint32_t instruction);
std::unique_ptr<instruction> get_auipc(std::uint32_t instruction);
std::unique_ptr<instruction> get_jal(std::uint32_t instruction);
std::unique_ptr<instruction> get_jalr(std::uint32_t instruction);
std::unique_ptr<instruction> get_branch(std::uint32_t instruction);
std::unique_ptr<instruction> get_load(std::uint32_t instruction);
std::unique_ptr<instruction> get_store(std::uint32_t instruction);
std::unique_ptr<instruction> get_itype(std::uint32_t instruction);
std::unique_ptr<instruction> get_rtype(std::uint32_t instruction);

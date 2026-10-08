cmake_minimum_required(VERSION 3.23)
project(riscv_testbench LANGUAGES CXX)
enable_testing()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(verilator REQUIRED)
find_package(Python3 REQUIRED COMPONENTS Interpreter)
find_program(RISCV_CLANG clang REQUIRED)
find_program(LLVM_OBJCOPY llvm-objcopy REQUIRED)

add_executable(rv32-assembler assembler.cpp)

add_executable(riscv-testbench
  reference_model/src/cpu.cpp
  reference_model/src/helpers.cpp
  reference_model/src/imem.cpp
  reference_model/src/instructions.cpp
  reference_model/src/ram.cpp
  main.cpp
)
target_include_directories(riscv-testbench PRIVATE reference_model/includes)

verilate(riscv-testbench
  TOP_MODULE tb_top
  PREFIX Vtb_top
  SOURCES ../src/cpu.v ../src/reg_file.v arch_ram.sv arch_instruction_mem.sv tb_top.sv
  VERILATOR_ARGS -Wno-CASEINCOMPLETE
)

add_test(NAME rv32i-arch-tests
  COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/run_rv32i_tests.py
    --suite ${CMAKE_CURRENT_SOURCE_DIR}/test_suite/I
    --work ${CMAKE_CURRENT_BINARY_DIR}/rv32i-I
    --simulator $<TARGET_FILE:riscv-testbench>
    --clang ${RISCV_CLANG}
    --objcopy ${LLVM_OBJCOPY}
    --include ${CMAKE_CURRENT_SOURCE_DIR}
    --linker-script ${CMAKE_CURRENT_SOURCE_DIR}/rv32i_link.ld
)

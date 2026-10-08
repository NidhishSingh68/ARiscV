cmake_minimum_required(VERSION 3.23)
project(riscv_testbench LANGUAGES CXX)
enable_testing()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(verilator REQUIRED)

set(INSTRUCTION_IMAGE ${CMAKE_CURRENT_BINARY_DIR}/instructions.txt)
add_executable(rv32-assembler assembler.cpp)

add_custom_command(
  OUTPUT ${INSTRUCTION_IMAGE}
  COMMAND $<TARGET_FILE:rv32-assembler>
          ${CMAKE_CURRENT_SOURCE_DIR}/programs/add.s ${INSTRUCTION_IMAGE}
  DEPENDS rv32-assembler programs/add.s
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
  VERBATIM
)
add_custom_target(assemble_program DEPENDS ${INSTRUCTION_IMAGE})

add_executable(riscv-testbench
  reference_model/src/cpu.cpp
  reference_model/src/helpers.cpp
  reference_model/src/imem.cpp
  reference_model/src/instructions.cpp
  reference_model/src/ram.cpp
  main.cpp
)
target_include_directories(riscv-testbench PRIVATE reference_model/includes)
add_dependencies(riscv-testbench assemble_program)
add_test(NAME riscv-testbench COMMAND riscv-testbench)

verilate(riscv-testbench
  TOP_MODULE tb_top
  PREFIX Vtb_top
  SOURCES ../src/cpu.v ../src/reg_file.v ../src/ram.v ../src/inst_mem.v tb_top.sv
  VERILATOR_ARGS -Wno-CASEINCOMPLETE
)

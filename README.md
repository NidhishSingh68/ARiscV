# AriscV

AriscV is another RISC-V core, written in Verilog. The CPU logic is kept separate from the instruction memory and RAM, which makes the design easier to port.

The core was designed for the Tang Primer 25K. Porting it to another FPGA should be straightforward, though the FPGA-specific memory setup may need to change. The current Gowin project targets the GW5A-25 device on that board.

## Project layout

The main CPU logic is in `src/cpu.v`. It handles instruction fetch, decode, execute, memory access, and writeback. `src/inst_mem.v` provides instructions, and `src/ram.v` handles data loads and stores. The `src/soc.v` module connects these pieces and includes a simple MMIO interface for the onboard LED. The LED is a basic proof that the core can access a peripheral.

`flow.tcl` opens that project in Gowin EDA, applies the project options, and runs the build flow. The `compile.sh` script launches Gowin's command-line tool with `flow.tcl` to produce the bitstream.

## Build and flash

Programs are compiled with Clang for bare-metal RV32I. The build details are handled by `programs/mem_file_gen.py`, which also includes the startup code and linker script from `programs/common/`. Run the script from the `programs` directory and pass it one or more source files:

```sh
cd programs
python3 mem_file_gen.py blinky/main.c
```

The script creates the program's ELF and binary files alongside the source, then writes the binary bytes to `memory/memory.mi`. The instruction memory reads this file when Gowin builds the FPGA image.

The program is stored in the FPGA's BSRAM. The FPGA can only load a changed program when that memory is included in a newly generated bitstream, so rebuild the bitstream each time the program changes. From the project root, run:

```sh
./compile.sh
./flash.sh
```

`compile.sh` uses Gowin EDA to build the bitstream through `flow.tcl`. The script currently expects Gowin EDA at the path set in `compile.sh`. `flash.sh` programs the Tang Primer 25K using [openFPGALoader](https://github.com/trabucayre/openFPGALoader). By default, it loads the bitstream for the current session. Set `PROGRAM_TO_SPI_FLASH=1` when you want to write it to the board's SPI flash.

## Tests

The assembly tests in `test/test_suite/I` are RV32I tests from the [RISC-V Architectural Tests](https://github.com/riscv/riscv-arch-test). They cover the base integer instruction set. The test runner strips test configuration comments and builds each assembly file with Clang. Verilator simulates the Verilog core while a separate C++ RISC-V reference model runs alongside it. After each instruction executes, the testbench compares the core's program counter and register state with the reference model.

You will need CMake, Verilator, Clang, and `llvm-objcopy` installed and available on your `PATH`. Configure and build the testbench from the project root, then run the tests with CTest:

```sh
cmake -S test -B test/build
cmake --build test/build
ctest --test-dir test/build --output-on-failure
```

#!/usr/bin/env python3
"""Compile and run the unprivileged RV32I architectural tests with the RTL model."""

import argparse
import pathlib
import subprocess
import sys


def run(command: list[str], cwd: pathlib.Path | None = None) -> None:
    subprocess.run(command, check=True, cwd=cwd)


def strip_config(source: pathlib.Path, target: pathlib.Path) -> None:
    lines = source.read_text().splitlines()
    output: list[str] = []
    in_config = False
    for line in lines:
        if "START_TEST_CONFIG" in line:
            in_config = True
        elif "END_TEST_CONFIG" in line:
            in_config = False
        elif not in_config:
            output.append(line)
    target.write_text("\n".join(output) + "\n")


def write_hex(binary: pathlib.Path, target: pathlib.Path) -> None:
    target.write_text("".join(f"{byte:02x}\n" for byte in binary.read_bytes()))


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--suite", type=pathlib.Path, required=True)
    parser.add_argument("--work", type=pathlib.Path, required=True)
    parser.add_argument("--simulator", type=pathlib.Path, required=True)
    parser.add_argument("--clang", required=True)
    parser.add_argument("--objcopy", required=True)
    parser.add_argument("--include", type=pathlib.Path, required=True)
    parser.add_argument("--linker-script", type=pathlib.Path, required=True)
    args = parser.parse_args()

    args.work.mkdir(parents=True, exist_ok=True)
    sources = sorted(args.suite.glob("*.S"))
    if not sources:
        print(f"No RV32I assembly tests found in {args.suite}", file=sys.stderr)
        return 1

    failures: list[str] = []
    for source in sources:
        stem = source.stem
        prepared = args.work / f"{stem}.S"
        elf = args.work / f"{stem}.elf"
        binary = args.work / f"{stem}.bin"
        memory = args.work / "memory.hex"
        strip_config(source, prepared)
        try:
            run([
                args.clang,
                "--target=riscv32-unknown-elf",
                "-march=rv32i_zicsr_zifencei",
                "-mabi=ilp32",
                "-mno-relax",
                "-nostdlib",
                "-fuse-ld=lld",
                f"-I{args.include}",
                f"-Wl,-T,{args.linker_script}",
                "-Wl,--no-relax",
                str(prepared),
                "-o",
                str(elf),
            ])
            run([args.objcopy, "-O", "binary", str(elf), str(binary)])
            write_hex(binary, memory)
            print(f"Running {source.name}", flush=True)
            run([str(args.simulator), str(binary)], cwd=args.work)
        except subprocess.CalledProcessError as error:
            print(f"RV32I test failed: {source.name}", file=sys.stderr)
            failures.append(source.name)

    if failures:
        print(f"Failed {len(failures)} of {len(sources)} RV32I/I tests: {', '.join(failures)}", file=sys.stderr)
        return 1
    print(f"Passed all {len(sources)} RV32I/I architectural tests")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

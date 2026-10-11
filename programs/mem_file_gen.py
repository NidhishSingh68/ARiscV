#!/usr/bin/env python3

import argparse
from pathlib import Path
import textwrap
import subprocess
import sys


def run(command: list[str], cwd: pathlib.Path | None = None) -> None:
    subprocess.run(command, check=True, cwd=cwd)


def write_hex(binary: pathlib.Path, target: pathlib.Path) -> None:
        target.write_text("".join(f"{byte:02x}\n" for byte in binary.read_bytes()))

def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("files", nargs="+")
    parser.add_argument("--objcopy", default="/usr/bin/llvm-objcopy")
    args = parser.parse_args()

    sources = [Path("./common/startup.s"), *(Path(f) for f in args.files)]
    cc = "/usr/bin/clang"
    linker_script = "./common/rv32i_link.ld"

    output_dir = Path(args.files[0]).parent
    elf = output_dir / "a.elf"
    binary = output_dir / "a.bin"
    memory = Path("../memory/memory.mi")

    try:
        subprocess.run(
            [
                cc,
                "--target=riscv32-unknown-elf",
                "-march=rv32i_zicsr_zifencei",
                "-mabi=ilp32",
                "-nostdlib",
                "-fuse-ld=lld",
                "-T", linker_script,
                *map(str, sources),
                "-o", str(elf),
            ],
            check=True,
        )

        subprocess.run(
            [args.objcopy, "-O", "binary", str(elf), str(binary)],
            check=True,
        )
        write_hex(binary, memory)

    except subprocess.CalledProcessError as error:
        print(f"RV32I test failed: {error}", file=sys.stderr)
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())

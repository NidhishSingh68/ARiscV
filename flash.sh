#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
BITSTREAM="$SCRIPT_DIR/impl/pnr/riscV.fs"
OPENFPGALOADER=${OPENFPGALOADER:-openFPGALoader}

if [[ ! -f "$BITSTREAM" ]]; then
    echo "Error: Gowin did not produce the bitstream: $BITSTREAM" >&2
    exit 1
fi

if [[ "${PROGRAM_TO_SPI_FLASH:-0}" == 1 ]]; then
    exec "$OPENFPGALOADER" -b tangprimer25k -f "$BITSTREAM"
else
    exec "$OPENFPGALOADER" -b tangprimer25k "$BITSTREAM"
fi

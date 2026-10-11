#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
GOWIN_BIN=/home/ns68/Documents/GowinIDE/IDE/bin

export LD_LIBRARY_PATH="$GOWIN_BIN/../lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export QT_QPA_PLATFORM=offscreen

cd -- "$SCRIPT_DIR"
"$GOWIN_BIN/gw_sh" "$SCRIPT_DIR/flow.tcl"


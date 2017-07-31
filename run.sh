#!/bin/bash 

# Figure out absolute path to directory in which this script is located
GAME_DIR=$(cd "${0%/*}" && echo $PWD)

GAME_CONFIG="${GAME_DIR}/dosbox.conf"

# Ascertain system architecture
case "$(uname -m)" in
  x86_64|amd64)
    BITS="64bit";;
  i?86)
    BITS="32bit";;
  *)
    exit 1;;
esac

# Include DOSBox libraries in system search paths
export LD_LIBRARY_PATH="${GAME_DIR}/dosbox-${BITS}/lib:${LD_LIBRARY_PATH}"

# Start DOSBox emulator and launch the game
cd "${GAME_DIR}"
"${GAME_DIR}/dosbox-${BITS}/bin/dosbox" -conf "${GAME_CONFIG}"

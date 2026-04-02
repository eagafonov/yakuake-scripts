#!/bin/sh

# Yakuake script helper functions

# Determine which qdbus command to use
# Sets QDBUS_CMD variable and exits with error if neither command is available
detect_qdbus_command() {
    if command -v qdbus6 >/dev/null 2>&1; then
        QDBUS_CMD=qdbus6
    elif command -v qdbus >/dev/null 2>&1; then
        QDBUS_CMD=qdbus
    else
        echo "Error: Neither qdbus6 nor qdbus found. Please install Qt D-Bus tools (Qt5 or Qt6)."
        exit 1
    fi
}

# Check if fzf is available
# Exits with error if fzf is not found
check_fzf() {
    if ! command -v fzf >/dev/null 2>&1; then
        echo "Error: fzf not found. Please install fzf (fuzzy finder)."
        exit 1
    fi
}

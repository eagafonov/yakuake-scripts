#!/bin/sh

set -e
set -u

script=$(readlink -f "$0")
R=$(dirname "$script")

# Source shared functions
. "$R/yakuake-functions.sh"

# Determine which qdbus command to use
detect_qdbus_command

# Get session ID from command line argument
SESSION_ID=${1:-}

# Validate session ID
if [ -z "$SESSION_ID" ]; then
    echo "Error: No session ID provided"
    echo "Usage: $0 <session-id>"
    exit 1
fi

# Switch to the specified tab
$QDBUS_CMD org.kde.yakuake /yakuake/sessions org.kde.yakuake.raiseSession "$SESSION_ID"

# Toggle Yakuake window state (show/hide)
# $QDBUS_CMD org.kde.yakuake /yakuake/window org.kde.yakuake.toggleWindowState

echo "Switched to tab with session ID: $SESSION_ID"

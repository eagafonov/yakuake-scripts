#!/bin/sh

set -e
set -u

# Check if qdbus6 is available
if ! command -v qdbus6 >/dev/null 2>&1; then
    echo "Error: qdbus6 not found. Please install Qt6 D-Bus tools."
    exit 1
fi

# Get the new title from command line argument or use current folder name
NEW_TITLE=${1:-$(basename "$(pwd)")}

# Get the active session ID
SESSION_ID=$(qdbus6 org.kde.yakuake /yakuake/sessions org.kde.yakuake.activeSessionId)

echo "Renaming current tab (session ${SESSION_ID}) to: ${NEW_TITLE}"

# Set the new tab title
qdbus6 org.kde.yakuake /yakuake/tabs org.kde.yakuake.setTabTitle ${SESSION_ID} "${NEW_TITLE}"

echo "Tab renamed successfully!"

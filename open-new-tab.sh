#!/bin/sh

set -e
set -u

if ! command -v qdbus6 >/dev/null 2>&1; then
    echo "Error: qdbus6 not found. Please install Qt6 D-Bus tools."
    exit 1
fi

TITLE=${1:-}

WORKDIR=${2:-$(pwd)}

SESSION_ID=$(qdbus6 org.kde.yakuake /yakuake/sessions org.kde.yakuake.addSession)

echo "New session added $SESSION_ID"

qdbus6 org.kde.yakuake /yakuake/sessions runCommandInTerminal ${SESSION_ID} " cd \"${WORKDIR}\"; reset"

if [ -n "${TITLE}" ]; then
    qdbus6 org.kde.yakuake /yakuake/tabs org.kde.yakuake.setTabTitle ${SESSION_ID} "${TITLE}"
fi

qdbus6 org.kde.yakuake /yakuake/sessions org.kde.yakuake.raiseSession ${SESSION_ID}
qdbus6 org.kde.yakuake /yakuake/window org.kde.yakuake.toggleWindowState

#!/bin/sh

set -e
set -u

TITLE=${1:-}

WORKDIR=${2:-$(pwd)}

SESSION_ID=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.addSession)

echo "New session added $SESSION_ID"

qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal ${SESSION_ID} " cd \"${WORKDIR}\"; reset"

if [ -n "${TITLE}" ]; then
    qdbus org.kde.yakuake /yakuake/tabs org.kde.yakuake.setTabTitle ${SESSION_ID} "${TITLE}"
fi

qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.raiseSession ${SESSION_ID}
qdbus org.kde.yakuake /yakuake/window org.kde.yakuake.toggleWindowState

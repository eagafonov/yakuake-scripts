#!/bin/sh

set -e
set -u

script=$(readlink -f "$0")
R=$(dirname "$script")

# Source shared functions
. "$R/yakuake-functions.sh"

# Determine which qdbus command to use
detect_qdbus_command

TITLE=${1:-}

WORKDIR=${2:-$(pwd)}

SESSION_ID=$($QDBUS_CMD org.kde.yakuake /yakuake/sessions org.kde.yakuake.addSession)

echo "New session added $SESSION_ID"

$QDBUS_CMD org.kde.yakuake /yakuake/sessions runCommandInTerminal ${SESSION_ID} " cd \"${WORKDIR}\"; reset"

if [ -n "${TITLE}" ]; then
    $QDBUS_CMD org.kde.yakuake /yakuake/tabs org.kde.yakuake.setTabTitle ${SESSION_ID} "${TITLE}"
fi

$QDBUS_CMD org.kde.yakuake /yakuake/sessions org.kde.yakuake.raiseSession ${SESSION_ID}
$QDBUS_CMD org.kde.yakuake /yakuake/window org.kde.yakuake.toggleWindowState

#!/bin/sh

set -e
set -u

script=$(readlink -f "$0")
R=$(dirname "$script")

# Source shared functions
. "$R/yakuake-functions.sh"

# Determine which qdbus command to use
detect_qdbus_command

if [ "${1:-}" = "+" ] ; then
    shift
    NEW_TITLE="$(basename "$(pwd)") ${@}"
else
    NEW_TITLE=${@:-$(basename "$(pwd)")}
fi

# Get the active session ID
SESSION_ID=$($QDBUS_CMD org.kde.yakuake /yakuake/sessions org.kde.yakuake.activeSessionId)

echo "Renaming current tab (session ${SESSION_ID}) to: ${NEW_TITLE}"

# Set the new tab title
$QDBUS_CMD org.kde.yakuake /yakuake/tabs org.kde.yakuake.setTabTitle ${SESSION_ID} "${NEW_TITLE}"

echo "Tab renamed successfully!"

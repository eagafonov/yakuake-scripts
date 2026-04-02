#!/bin/sh

set -e
set -u

script=$(readlink -f "$0")
R=$(dirname "$script")

# Source shared functions
. "$R/yakuake-functions.sh"

# Determine which qdbus command to use
detect_qdbus_command

# Get all session IDs (comma-separated)
SESSION_IDS=$($QDBUS_CMD org.kde.yakuake /yakuake/sessions org.kde.yakuake.sessionIdList)

# Loop through each session and get its tab title
for SESSION_ID in $(echo "$SESSION_IDS" | tr ',' ' '); do
    TAB_TITLE=$($QDBUS_CMD org.kde.yakuake /yakuake/tabs org.kde.yakuake.tabTitle "$SESSION_ID")
    echo "$SESSION_ID: $TAB_TITLE"
done

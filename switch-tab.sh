#!/bin/sh

set -e
set -u

script=$(readlink -f "$0")
R=$(dirname "$script")

# Source shared functions
. "$R/yakuake-functions.sh"

# Check if fzf is available
check_fzf

"$R/list-tab-titles.sh" | fzf | cut -d: -f1 | xargs "$R/switch-to-tab.sh"
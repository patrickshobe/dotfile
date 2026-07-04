#!/usr/bin/env bash

set -euo pipefail

slot="${1:?slot is required}"
spaces_per_display="${2:-3}"
display_index="$(yabai -m query --displays --display | jq '.index')"
space_index="$(((display_index - 1) * spaces_per_display + slot))"

yabai -m space --focus "${space_index}"

#!/usr/bin/env bash

set -euo pipefail

spaces_per_display="${1:-3}"
display_count="$(yabai -m query --displays | jq 'length')"
target_spaces="$((display_count * spaces_per_display))"
current_spaces="$(yabai -m query --spaces | jq 'length')"

while (( current_spaces < target_spaces )); do
  yabai -m space --create
  current_spaces="$((current_spaces + 1))"
done

for ((display_index = 1; display_index <= display_count; display_index++)); do
  for ((slot = 1; slot <= spaces_per_display; slot++)); do
    space_index="$(((display_index - 1) * spaces_per_display + slot))"

    yabai -m space "${space_index}" --display "${display_index}" >/dev/null 2>&1 || true
    yabai -m space "${space_index}" --layout bsp
    yabai -m space "${space_index}" --label "d${display_index}-${slot}"
  done
done

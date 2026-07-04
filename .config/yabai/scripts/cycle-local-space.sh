#!/usr/bin/env bash

set -euo pipefail

direction="${1:?direction is required}"
display_index="$(yabai -m query --displays --display mouse | jq '.index')"
current_space="$(yabai -m query --spaces --display "${display_index}" | jq 'map(select(."is-visible" == true)) | .[0].index')"
space_indexes=($(yabai -m query --spaces --display "${display_index}" | jq 'sort_by(.index) | .[].index'))

if (( ${#space_indexes[@]} == 0 )); then
  exit 0
fi

current_position=0

for index in "${!space_indexes[@]}"; do
  if [[ "${space_indexes[index]}" == "${current_space}" ]]; then
    current_position="${index}"
    break
  fi
done

case "${direction}" in
  prev)
    target_position="$(((current_position - 1 + ${#space_indexes[@]}) % ${#space_indexes[@]}))"
    ;;
  next)
    target_position="$(((current_position + 1) % ${#space_indexes[@]}))"
    ;;
  *)
    printf 'unknown direction: %s\n' "${direction}" >&2
    exit 1
    ;;
esac

yabai -m space --focus "${space_indexes[target_position]}"

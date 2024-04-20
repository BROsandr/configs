#!/usr/bin/env bash

HM_DIR="${HM_DIR:-"${HOME}/.config/home-manager"}"

ORIG_FILES=(
  'apps/__all__.nix'
  'apps/git.nix'
  '__packages__.nix'
)

mkdir -p "${HM_DIR}/apps"

for FILE in "${ORIG_FILES[@]}"; do
  FILE_ABS=$(realpath "${FILE}")
  ln "${FILE_ABS}" "${HM_DIR}/${FILE}"
done

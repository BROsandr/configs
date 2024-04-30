#!/usr/bin/env bash

HM_DIR="${HM_DIR:-"${HOME}/.config/home-manager"}"

ORIG_FILES=(
  'apps/__all__.nix'
  'apps/git.nix'
  'apps/direnv.nix'
  'apps/bash.nix'
  'apps/micro.nix'
  'apps/bat.nix'
  'apps/nnn.nix'
  'apps/xdg.nix'
  'apps/micro/keybindings.json'
  'apps/walk.nix'

  '__packages__.nix'
)

mkdir -p "${HM_DIR}/apps"
mkdir -p "${HM_DIR}/apps/micro"

THIS_DIR=$(dirname "${0}")

for FILE in "${ORIG_FILES[@]}"; do
  FILE_ABS="${THIS_DIR}/${FILE}"
  ln "${FILE_ABS}" "${HM_DIR}/${FILE}"
done

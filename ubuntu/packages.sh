#!/usr/bin/env bash

LOG_PATH_ROOT="${LOG_PATH_ROOT:-"${HOME}"/var/log}"
LOG_PATH_THIS=$LOG_PATH_ROOT/packages

DEBUG_LOGFILE=${LOG_PATH_THIS}/debug.log
INFO_LOGFILE=${LOG_PATH_THIS}/info.log
ERROR_LOGFILE=${LOG_PATH_THIS}/error.log

mkdir -p "${LOG_PATH_THIS}"
echo > "${INFO_LOGFILE}"

function format_log_msg() {
  local msg="${1}"

  echo "$(date) '${msg}'"
}

function log_installation {
  local PKG="${1}"
  local SUCCESS="${2}"
  local LOG_PATH="${3}"

  if [ "${SUCCESS}" = true ] ; then
    format_log_msg "Package='${PKG}' was successfully installed." >> "${LOG_PATH}"
  else
    format_log_msg "Package='${PKG}' was not installed." >> "${LOG_PATH}"
  fi
}

function install {
  local PKG_NAME="${1}"
  local METHOD="${2:-apt}"
  local LOGFILE="${INFO_LOGFILE}"

  local SUCCESS=false

  case "${METHOD}" in
    apt)
      sudo apt --yes install "${PKG_NAME}" && SUCCESS=true
      ;;

    snap)
      sudo snap install "${PKG_NAME}" && SUCCESS=true
      ;;

    *)
      format_log_msg "Unknown installation method='${METHOD}'. Package='${PKG_NAME}'." >> "${LOGFILE}"
      ;;
  esac

  if [ "${SUCCESS}" = true ] ; then
    log_installation "${PKG_NAME}" true "${LOGFILE}"
  else
    log_installation "${PKG_NAME}" false "${LOGFILE}"
    return 1
  fi
}

(
  sudo apt update
  sudo apt upgrade

  APT_PKGS=(
    build-essential
    gcc
    clang
    stow
    verilator
    pip
    texlive-full
  )

  SNAP_PKGS=(
    universal-ctags
  )

  for PKG in "${APT_PKGS[@]}"; do
    install "${PKG}" apt
  done

  for PKG in "${SNAP_PKGS[@]}"; do
    install "${PKG}" snap
  done
) 1> "${DEBUG_LOGFILE}" 2> "${ERROR_LOGFILE}"

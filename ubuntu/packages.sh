#!/usr/bin/env bash

LOG_PATH_ROOT="${LOG_PATH_ROOT:-"${HOME}"/var/log}"
LOG_PATH_THIS=$LOG_PATH_ROOT/packages
mkdir -p "${LOG_PATH_THIS}"

DEBUG_LOGFILE=${LOG_PATH_THIS}/debug.log
echo > "${DEBUG_LOGFILE}"
INFO_LOGFILE=${LOG_PATH_THIS}/info.log
echo > "${INFO_LOGFILE}"
ERROR_LOGFILE=${LOG_PATH_THIS}/error.log
echo > "${ERROR_LOGFILE}"

function format_log_msg() {
  local SEVERITY="${1:-debug}"
  local MSG=$(cat)

  case "${SEVERITY}" in
    info)
      ;;

    debug)
      ;;

    error)
      ;;

    *)
      echo "Unsupported SEVERITY='${SEVERITY}'. MSG='${MSG}'." | format_log_msg error >&2 | tee -a "${ERROR_LOGFILE}"
      return 1
      ;;
  esac

  echo "$(date) | ${SEVERITY} | ${MSG}"
}

function log_cmd {
  local CMD="${1}"
  local SEVERITY="${2:-debug}"

  local LOGFILE=""
  case "${SEVERITY}" in
    info)
      LOGFILE="${INFO_LOGFILE}"
      ;;

    debug)
      LOGFILE="${DEBUG_LOGFILE}"
      ;;

    error)
      LOGFILE="${ERROR_LOGFILE}"
      ;;

    *)
      echo "Unsupported SEVERITY='${SEVERITY}'. CMD='${CMD}'." | format_log_msg error >&2 | tee -a "${ERROR_LOGFILE}"
      return 1
      ;;
  esac

  $(CMD) 1> >(format_log_msg "${SEVERITY}" >> "${LOGFILE}") 2> >(format_log_msg error | tee -a "${ERROR_LOGFILE}" >&2)
}

function log_installation {
  local PKG="${1}"
  local SUCCESS="${2}"
  local LOG_PATH="${3}"

  local LOG_MSG=""
  if [ "${SUCCESS}" = true ] ; then
    LOG_MSG=$(echo "Package='${PKG}' was successfully installed." | format_log_msg info)
  else
    LOG_MSG=$(echo "Package='${PKG}' was not installed." | format_log_msg info)
  fi
  echo "${LOG_MSG}" | tee -a "${LOG_PATH}"
}

function install {
  local PKG_NAME="${1}"
  local METHOD="${2:-apt}"
  local LOGFILE="${INFO_LOGFILE}"

  local SUCCESS=false

  case "${METHOD}" in
    apt)
      log_cmd "sudo apt-get --yes install ${PKG_NAME}" debug && SUCCESS=true
      ;;

    snap)
      log_cmd "sudo snap install ${PKG_NAME}" debug && SUCCESS=true
      ;;

    *)
      echo "Unknown installation method='${METHOD}'. Package='${PKG_NAME}'." | format_log_msg error >&2 | tee -a "${ERROR_LOGFILE}"
      ;;
  esac

  if [ "${SUCCESS}" = true ] ; then
    log_installation "${PKG_NAME}" true "${LOGFILE}"
  else
    log_installation "${PKG_NAME}" false "${LOGFILE}"
    return 1
  fi
}


sudo apt-get update 1>> "${DEBUG_LOGFILE}" 2>> "${ERROR_LOGFILE}"
sudo apt-get upgrade 1>> "${DEBUG_LOGFILE}" 2>> "${ERROR_LOGFILE}"

APT_PKGS=(
  build-essential
  gcc
  clang
  stow
  verilator
  python3
  pip
  texlive-full
  universal-ctags
  meson
  cmake
  git
)

SNAP_PKGS=(
)

for PKG in "${APT_PKGS[@]}"; do
  install "${PKG}" apt
done

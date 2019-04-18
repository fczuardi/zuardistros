#!/bin/bash

if_yes () {
  TEXT="$1"
  COMMAND="$2"
  REPLY="unknown"
  while [[ ! "$REPLY" =~ ^[YyNn]$ ]]; do
    read -n1 -p "$TEXT [Y/n]" -r REPLY
    [ "$REPLY" != "" ] && echo
    if [ "$REPLY" == "" ] || [[ "$REPLY" =~ ^[Yy]$ ]]; then
      $COMMAND
      break
    fi
  done
}

TO_INSTALL=()
TO_INSTALL+=("mosh")

if_yes "Install ${TO_INSTALL[@]}?" "sudo apt install ${TO_INSTALL[@]}"

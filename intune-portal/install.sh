#!/usr/bin/env bash

post_install() {
  [[ -f /etc/os-release.original ]] || cp /etc/os-release /etc/os-release.original
  cp /opt/microsoft/intune/share/os-release /etc/os-release
}

post_remove() {
  [[ -f /etc/os-release.original ]] && mv /etc/os-release.original /etc/os-release
}

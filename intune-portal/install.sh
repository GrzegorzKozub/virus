#!/usr/bin/env bash

post_install() {
  [[ -f /etc/os-release.original ]] || cp /etc/os-release /etc/os-release.original
  cp /opt/microsoft/intune/share/os-release /etc/os-release
}

post_remove() {
  [[ -f /etc/os-release.original ]] && mv /etc/os-release.original /etc/os-release
}

post_upgrade() {
  # Restart polkit to get any new authorization actions we put down
  systemctl restart polkit.service 2>/dev/null
}

post_install() {
  if [ -d /run/systemd/system ]; then
    systemd-tmpfiles --create intune.conf
  fi

  systemctl --system daemon-reload
  systemctl enable intune-daemon.socket --now

  post_upgrade

  echo "Please run: systemctl enable --now --user intune-agent.timer" 1>&2
}

pre_remove() {
  systemctl disable intune-daemon.socket --now
}

post_remove() {
  systemctl --system daemon-reload
}

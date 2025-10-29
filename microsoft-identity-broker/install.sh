#!/usr/bin/env bash

post_install() {
  systemctl daemon-reload
}

post_upgrade() {
  systemctl daemon-reload
}

pre_remove() {
  systemctl stop microsoft-identity-device-broker.service
}

post_remove() {
  systemctl daemon-reload
  echo ">>> Reboot or run systemctl --user stop microsoft-identity-broker"
}

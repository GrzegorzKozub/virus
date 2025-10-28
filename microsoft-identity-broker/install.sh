#!/usr/bin/env bash

post_install() {
  systemctl daemon-reload || true
}

post_upgrade() {
  systemctl daemon-reload || true
}

pre_remove() {
  systemctl stop microsoft-identity-devicebroker.service || true
}

post_remove() {
  systemctl daemon-reload || true
}

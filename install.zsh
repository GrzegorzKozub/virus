#!/usr/bin/env zsh

set -e -o verbose

# packages

pushd `dirname $0`/microsoft-identity-broker
makepkg --force --install --noconfirm --syncdeps
popd

pushd `dirname $0`/intune-portal
makepkg --force --install --noconfirm --syncdeps
popd

pushd `dirname $0` && git clean -dfx && popd

# services

systemctl --user enable --now intune-agent.timer

# links

cp /usr/share/applications/intune-portal.desktop $XDG_DATA_HOME/applications
sed -i \
  -e 's/^Name=Microsoft Intune$/Name=Intune/' \
  -e 's/^Exec=env /Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 /' \
  $XDG_DATA_HOME/applications/intune-portal.desktop


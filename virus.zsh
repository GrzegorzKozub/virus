#!/usr/bin/env zsh

set -e -o verbose

# packages

pushd `dirname $0`/microsoft-identity-broker
makepkg --force --install --noconfirm --syncdeps
popd

pushd `dirname $0`/intune-portal
makepkg --force --install --noconfirm --syncdeps
popd

# links

# cp /usr/share/applications/intune-portal.desktop $XDG_DATA_HOME/applications
# sed -i \
#   -e 's/^Name=Microsoft Intune$/Name=Intune/' \
#   -e 's/^Exec=env /Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 /' \
#   $XDG_DATA_HOME/applications/intune-portal.desktop

# services

# systemctl status microsoft-identity-device-broker.service
# systemctl --user status microsoft-identity-broker.service
#
# systemctl status intune-daemon.service
# systemctl --user status intune-agent.timer
# systemctl --user status intune-agent.service
#
# env WEBKIT_DISABLE_DMABUF_RENDERER=1 /opt/microsoft/intune/bin/intune-portal


# cleanup

# . `dirname $0`/packages.zsh

# dotfiles

# . ~/code/dot/virus.zsh


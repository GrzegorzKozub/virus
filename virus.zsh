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

# links

for APP in \
  java-java11-openjdk \
  jconsole-java11-openjdk \
  jshell-java11-openjdk
do
  cp /usr/share/applications/$APP.desktop $XDG_DATA_HOME/applications
  sed -i '2iNoDisplay=true' $XDG_DATA_HOME/applications/$APP.desktop
done

cp /usr/share/applications/intune-portal.desktop $XDG_DATA_HOME/applications
sed -i \
  -e 's/^Name=Microsoft Intune$/Name=Intune/' \
  -e 's/^Exec=env /Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 /' \
  $XDG_DATA_HOME/applications/intune-portal.desktop

# cleanup

. ~/code/arch/packages.zsh


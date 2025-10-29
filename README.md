# Virus



Before you can enroll your device, you need to enable the service and timer and then reboot:
'sudo systemctl enable intune-daemon.service'
For GNOME based systems:
'systemctl --user enable intune-agent.service intune-agent.timer

The registration file is not in the correct location for Intune Portal to find it.
So please create the symlink for it:
'mkdir -p ~/.local/state/intune'
'ln -s ~/.config/intune/registration.toml ~/.local/state/intune/registration.toml'


https://myaccount.microsoft.com/device-list

 https://github.com/recolic/microsoft-intune-archlinux?tab=readme-ov-file
 https://www.reddit.com/r/archlinux/comments/1nwg65t/enrollment_of_arch_linuxpc_in_microsoft_intune/
 https://git.recolic.net/root/microsoft-intune-archlinux
 https://aur.archlinux.org/packages/intune-portal-bin
https://aur.archlinux.org/packages/microsoft-identity-broker-bin
 https://github.com/siemens/linux-entra-sso


https://aur.archlinux.org/packages/microsoft-identity-broker-bin
https://aur.archlinux.org/packages/intune-portal-bin

https://packages.microsoft.com/ubuntu/24.04/prod/pool/main/m/microsoft-identity-broker/
https://packages.microsoft.com/ubuntu/24.04/prod/pool/main/i/intune-portal/


https://wiki.archlinux.org/title/PKGBUILD
https://wiki.archlinux.org/title/Makepkg

https://aur.archlinux.org/packages/microsoft-edge-stable-bin

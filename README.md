# Virus

Register Arch Linux device with Microsoft Intune

## Installation

1. Run `~/code/virus/virus.zsh`

### Manual config

1. Start Intune and sign in to your Microsoft account (you are NOT prompted for MFA)
2. See that your device is showing on your Microsoft account [device list](https://myaccount.microsoft.com/device-list)
3. Sign in to Edge using Entra SSO (you are prompted for MFA)

## Services

Services provided by `microsoft-identity-broker` are started by Edge so when using Brave and `linux-entra-sso` they should be enabled and started via `systemd`

```sh
systemctl status microsoft-identity-device-broker.service
systemctl --user status microsoft-identity-broker.service
```

Services provided by `intune-portal` can be left disabled

```sh
systemctl status intune-daemon.service
systemctl --user status intune-agent.timer
systemctl --user status intune-agent.service
```

## References

Guides

- [Intune for Arch Linux](https://git.recolic.net/root/microsoft-intune-archlinux)

Original AUR packages

- [microsoft-identity-broker-bin](https://aur.archlinux.org/packages/microsoft-identity-broker-bin) ([sources](https://packages.microsoft.com/ubuntu/24.04/prod/pool/main/m/microsoft-identity-broker/))
- [intune-portal-bin](https://aur.archlinux.org/packages/intune-portal-bin) ([sources](https://packages.microsoft.com/ubuntu/24.04/prod/pool/main/i/intune-portal/))

Using Entra SSO with Brave

- [linux-entra-sso](https://github.com/siemens/linux-entra-sso)

## Known issues

Currently, only `intune-portal` 1.2503.10 and `microsoft-identity-broker` 2.0.1 seem to work. More recent versions are broken.


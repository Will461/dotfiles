Update packages:
sudo pacman-key --refresh-keys

Wifi connection:
nmcli dev wifi
nmcli dev wifi connect <BSSID>/<SSID> password <password>
nmcli connection show
nmcli connection delete <SSID>

VPN connection:
sudo su
cd /etc/wireguard
wg-quick up london
wg-quick down london

Bluetooth:
Pair new device:
bluetoothctl
power on
agent on
default-agent
scan on
trust <MAC> (tab complete)
pair <MAC>
Remove device:
Same as above until scan
devices
untrust <MAC>
remove <MAC>


All installed packages (generated with pacman -Qe | cut -d ' ' -f1):
base
base-devel
bc
bluez
bluez-utils
dash
dmidecode
dosfstools
dunst
efibootmgr
ex-vi-compat
fastfetch
fd
feh
ffmpeg
fwupd
fzf
git
gobject-introspection
grub
intel-ucode
jq
keepassxc
libnotify
librewolf-bin
librewolf-bin-debug
libx11
libxft
libxinerama
linux
linux-firmware
man-db
mpv
neovim
networkmanager
ntfs-3g
openresolv
openssh
pass
pass-otp
picom
pulseaudio
pulseaudio-bluetooth
python-pip
python-setuptools
redshift
ripgrep
shellcheck
udisks2
unzip
vim
webkit2gtk
wireguard-tools
xbindkeys
xclip
xorg-server
xorg-xinit
xorg-xsetroot
yazi
zip
zoxide
zsh

#!/usr/bin/env bash
set -e

# Remove proxy setting
export HTTP_PROXY=
export http_proxy=
export HTTPS_PROXY=
export https_proxy=
export FTP_PROXY=
export ftp_proxy=

# Arch Linux Install Script (alis) installs unattended, automated
# and customized Arch Linux system.
# Copyright (C) 2018 picodotdev

rm -f alis.conf
rm -f alis.sh
rm -f alis-asciinema.sh
rm -f alis-reboot.sh

rm -f alis-recovery.conf
rm -f alis-recovery.sh
rm -f alis-recovery-asciinema.sh
rm -f alis-recovery-reboot.sh

wget https://raw.githubusercontent.com/shahrukh-alizai/alis/master/alis.conf
wget https://raw.githubusercontent.com/shahrukh-alizai/alis/master/alis.sh
wget https://raw.githubusercontent.com/shahrukh-alizai/alis/master/alis-asciinema.sh
wget https://raw.githubusercontent.com/shahrukh-alizai/alis/master/alis-reboot.sh

wget https://raw.githubusercontent.com/shahrukh-alizai/alis/master/alis-recovery.conf
wget https://raw.githubusercontent.com/shahrukh-alizai/alis/master/alis-recovery.sh
wget https://raw.githubusercontent.com/shahrukh-alizai/alis/master/alis-recovery-asciinema.sh
wget https://raw.githubusercontent.com/shahrukh-alizai/alis/master/alis-recovery-reboot.sh

chmod +x alis.sh
chmod +x alis-asciinema.sh
chmod +x alis-reboot.sh

chmod +x alis-recovery.sh
chmod +x alis-recovery-asciinema.sh
chmod +x alis-recovery-reboot.sh

# Configure pacman mirrors
pacman -Syy
pacman -S reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector -c "US" -f 12 -l 10 -n 12 --protocol http --save /etc/pacman.d/mirrorlist

# Setting up proxy
PROXY_ADDR="192.168.10.200:3128"
export HTTP_PROXY=http://$PROXY_ADDR/
export http_proxy=http://$PROXY_ADDR/
export HTTPS_PROXY=http://$PROXY_ADDR/
export https_proxy=http://$PROXY_ADDR/
export FTP_PROXY=http://$PROXY_ADDR/
export ftp_proxy=http://$PROXY_ADDR/
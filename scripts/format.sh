#!/usr/bin/env bash

echo " ███▄    █  ██▓▒██   ██▒ ▒█████    ██████ "
echo " ██ ▀█   █ ▓██▒▒▒ █ █ ▒░▒██▒  ██▒▒██    ▒ "
echo "▓██  ▀█ ██▒▒██▒░░  █   ░▒██░  ██▒░ ▓██▄   "
echo "▓██▒  ▐▌██▒░██░ ░ █ █ ▒ ▒██   ██░  ▒   ██▒"
echo "▒██░   ▓██░░██░▒██▒ ▒██▒░ ████▓▒░▒██████▒▒"
echo "░ ▒░   ▒ ▒ ░▓  ▒▒ ░ ░▓ ░░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░"
echo "░ ░░   ░ ▒░ ▒ ░░░   ░▒ ░  ░ ▒ ▒░ ░ ░▒  ░ ░"
echo "   ░   ░ ░  ▒ ░ ░    ░  ░ ░ ░ ▒  ░  ░  ░  "
echo "         ░  ░   ░    ░      ░ ░        ░  "
echo "                                          "

disk=$1
echo ""
echo "===P A R T I T I O N==="
echo ""
parted -s $disk -- mklabel gpt
parted -s $disk -- mkpart root ext4 512MiB -8GB
parted -s $disk -- mkpart swap linux-swap -8GB 100%
parted -s $disk -- mkpart ESP fat32 1MiB 512MiB
parted -s $disk -- set 3 esp on

echo ""
echo "===F O R M A T I N G==="
echo ""
mkfs.ext4 -L nixos $disk"p1"
mkswap -L swap $disk"p2"
mkfs.fat -F 32 -n boot $disk"p3"

echo ""
echo "===M O U N T I N G==="
echo ""
umount -a
mount -v
mount /dev/disk/by-label/nixos /mnt --mkdir
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot --mkdir
swapon /dev/disk/by-label/swap
mount -v
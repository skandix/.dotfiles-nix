#!/usr/bin/env bash
disk=$1
echo "PARTITION"
echo ""
parted $disk -- mklabel gpt
parted $disk -- mkpart primary 512MiB -200MiB
parted $disk -- mkpart primary linux-swap -200MiB 100%
parted $disk -- mkpart ESP fat32 1MiB 512MiB
parted $disk -- set 3 esp on

echo "FORMATING"
echo ""
mkfs.ext4 -L nixos "$disk"1
mkswap -L swap "$disk"2
mkfs.fat -F 32 -n boot "$disk"3

echo "MOUNTING"
echo ""
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/disk/by-label/swap
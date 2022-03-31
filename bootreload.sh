#!/bin/bash

#======================================================================
    ####   ####  ##  #  ##  #  ##     ####
    ##  #   ##   ## #   ## #   ##       #
    ####    ##   ###    ###    ##      #
    ##      ##   ## #   ## #   ##     #
    ##     ####  ##  #  ##  #  ####  ####
#======================================================================

#======================================================================
#Script para reinstalar bootloader na pen para o pc do curso
#======================================================================

#montar as partições

mount /dev/nvme0n1p6 /mnt
mount /dev/sda1 /mnt/boot
swapon /dev/nvme0n1p5
mount /dev/nvme0n1p7 /mnt/home

read -p "Particoes montadas..."


#reinstalar o bootloader

arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/boot --recheck /dev/sda

read -p "Grub reinstalado..."

#desmontar as partições

umount -R /mnt

read -p "Particoes desmontadas, press enter pa reiniciar..."

#reiniciar

reboot

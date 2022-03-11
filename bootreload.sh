#!/bin/bash

#======================================================================

 ####   ####  ##  #  ##  #  ##     ####
 ##  #   ##   ## #   ## #   ##       #
 ####    ##   ###    ###    ##      # 
 ##      ##   ## #   ## #   ##     #  
 ##     ####  ##  #  ##  #  ####  ####

#======================================================================

#=======================================================================
#Script para reinstalar bootloader na pen para o pc do curso
#=======================================================================

#montar as partições

mount /dev/nvme /mnt
swapon /dev/nvme
mkdir /mnt/{home,boot}
mount /dev/sda1 /mnt/boot
mount /dev/nvme /mnt/home

#reinstalar o bootloader

grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB

#desmontar as partições

umount -all

#reiniciar

reboot

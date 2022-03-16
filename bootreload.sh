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

mount /dev/nvme0n1p6 /mnt
mkdir /mnt/{home,boot}
mount /dev/sda1 /mnt/boot
swapon /dev/nvme0n1p5
mount /dev/nvme0n1p7 /mnt/home

#reinstalar o bootloader

arch-chroot /mnt /root
grub-install --target=x86_64-efi --efi-directory=/boot --recheck /dev/sda

#desmontar as partições

umount -R /mnt

#reiniciar

reboot

#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Bogota /etc/localtime
hwclock --systohc
sed -i '185s/.//' /etc/locale.gen
locale-gen
echo "LANG=es_CO.UTF-8" >> /etc/locale.conf
echo "KEYMAP=la-latin1" >> /etc/vconsole.conf
echo "redakuma" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 redakuma.localdomain redakuma" >> /etc/hosts
echo root:12345 | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm
 
pacman -S grub efibootmgr networkmanager networkmanager-runit network-manager-applet linux-headers dosfstools xdg-user-dirs xdg-utils intel-ucode bluez bluez-runit bluez-utils cups cups-runit

pacman -S xf86_64-video-intel xorg --ignore xorg-server-xdmx sddm sddm-runit

# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub 
#change the directory to /boot/efi is you mounted the EFI partition at /boot/efi

#grub-mkconfig -o /boot/grub/grub.cfg

#systemctl enable NetworkManager
#systemctl enable bluetooth
#systemctl enable cups.service
#systemctl enable sshd
#systemctl enable avahi-daemon
#systemctl enable tlp # You can comment this command out if you didn't install tlp, see #above
#systemctl enable reflector.timer
#systemctl enable fstrim.timer
#systemctl enable libvirtd
#systemctl enable firewalld
#systemctl enable acpid

#useradd -mG wheel red
#echo red:1234 | chpasswd


printf "\e[1;32mLo lograste! Type exit, umount -R /mnt and reboot.\e[0m"





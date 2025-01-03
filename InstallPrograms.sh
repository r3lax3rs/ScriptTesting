#!/bin/bash
# Make sure this script is run as root
if [[ $EUID -eq 0 ]]; then
    echo
    echo "Don't run this script as root. It can mess up your system" 1>&2
    echo
    exit
fi
wait
#First lets make sure our system is updated
sudo pacman -Syu --noconfirm
wait
#Let's first install yay; a packet manager
git clone https://aur.archlinux.org/yay.git
wait
cd yay
makepkg -si --noconfirm
wait
#Now let's update yay; NEVER RUN 'yay -Syu' as SUDO or ROOT!!!
yay -Syu --noconfirm
wait
#Let's install our programs
#Install Brave Browser
yay -S brave-bin --needed --noconfirm
#Install Steam
sudo pacman -S steam --needed --noconfirm
#Install Discord
sudo pacman -S discord --needed --noconfirm
#Install Spotify
yay -S spotify --needed --noconfirm
#Install Google Chrome
yay -S google-chrome --needed --noconfirm
#Install NordVPN
yay -S nordvpn-bin --needed --noconfirm
#Install Teamspeak3
sudo pacman -S teamspeak3 --needed --noconfirm
#Install Telegram Desktop App
sudo pacman -S telegram-desktop --needed --noconfirm
#Install Geany (notepad)
sudo pacman -S geany --needed --noconfirm
#Install curl
sudo pacman -S curl --needed --noconfirm
#Install OpenTabletDriver
# Downloads the pkgbuild from the AUR.
git clone https://aur.archlinux.org/opentabletdriver.git
wait
# Changes into the correct directory, pulls needed dependencies, then installs OpenTabletDriver
cd opentabletdriver && makepkg -si --noconfirm
wait
# Clean up leftovers
cd ..
rm -rf opentabletdriver
wait
# Regenerate initramfs
sudo mkinitcpio -P
wait
# Unload kernel modules
sudo rmmod wacom hid_uclogic
wait
#Install 1password
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
wait
git clone https://aur.archlinux.org/1password.git
wait
cd 1password
wait
makepkg -si --noconfirm
#This part is to install Qem/KVM & VirtManager TODO
#Install everything needed for QEMU/KVM Virtmanager
sudo pacman -S qemu-full qemu-img libvirt virt-install virt-manager virt-viewer edk2-ovmf dnsmasq swtpm guestfs-tools libosinfo tuned --noconfirm --needed
wait
#Enable services for Virtmanager
sudo systemctl enable libvirtd.service
wait
sudo systemctl start libvirtd.service
echo "QEMU/KVM Virtmanager has been installed"
#Installing the part that is needed to share clipboard for VM's
#sudo pacman -S spice-vdagent
#End of script
echo "Everything has been installed"
sleep 2
echo "Exiting script"
sleep 2

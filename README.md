a_#My own installation script to make life a bit easier
#Some steps need to be done manually before using these
#When installing arch fresh even before using the default "archinstall" command to trigger the install script:
pacman-key --init
pacman-key --populate archlinux
pacman -Sy git base-devel --needed --noconfirm
git clone https://github.com/r3lax3rs/ScriptTesting
cd ScriptTesting
chmod +x PreInstall.sh
./PreInstall.sh

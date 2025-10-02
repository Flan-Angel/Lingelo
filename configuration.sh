#!/bin/bash
clear
echo "Specify your init system

SystemD (Used on most linux distros including Arch) = sysd 
Dinit = dn"
read binits

#systemd part
if [[ $binits == dn ]]; then
  clear
  echo "mmm Artix user huh? pretty kewl :3"

  echo "Let's start with secutity"
  # dinitctl enable apparmor

  echo "Updating ClamAV virus database"
  freshclam

  clear
  echo "Firewall setup is uhhh happening :)"
  dinitctl enable ufw
  ufw limit 22/tcp
  ufw allow 80/tcp
  ufw allow 443/tcp
  ufw default deny incoming
  ufw default allow outgoing
  dinitctl start ufw

  clear
  echo "Configuring Hardware saving stuff + Power Profiles"
  dinit enable thermald
  dinit start thermald
  dinit enable power-profiles-daemon
  dinit start power-profiles-daemon

  clear
  echo "Configuring Bluetooth"
  dinit enable bluetooth.service
  dinit start bluetooth.service

  clear
  echo "Configuring Sound"
  dinit enable pipewire-pulse
  dinit start pipewire-pulse

else
  clear
  echo "Mmm SystemD poser smh (jkjk)"
  sleep 2s

  clear
  echo "Let's start with security"
  # systemctl enable apparmor
  #do this bit

  clear
  echo "Updating ClamAV virus database"
  freshclam

  clear
  echo "Setting up firewall"
  systemctl enable ufw
  ufw limit 22/tcp
  ufw allow 80/tcp
  ufw allow 443/tcp
  ufw default deny incoming
  ufw default allow outgoing
  systemctl start ufw

  clear
  echo "Configuring Hardware saving stuff + Power Profiles"
  systemctl enable thermald
  systemctl start thermald
  systemctl enable power-profiles-daemon
  systemctl start power-profiles-daemon

  clear
  echo "Configuring Bluetooth"
  systemctl enable bluetooth.service
  systemctl start bluetooth.service

  clear
  echo "Configuring Sound"
  systemctl enable pipewire-pulse
  systemctl start pipewire-pulse
fi

#User creation
clear
read -p "Create new user? Usually you dont use the root account (y/N)" bitch

if [[ $bitch == y ]]; then
  echo "Name your User"
  read busr
  echo "Make password for" $busr
  read -s bpass
  useradd -m -g wheel -p $bpass $busr
  clear
  echo "Editing sudoers so wheel group users have sudo privilage"
  sed -i 's/# %wheel ALL=(ALL:ALL) ALL/  %wheel ALL=(ALL:ALL) ALL/' /etc/sudoers
  echo "Logging into non root user"
  su - $busr
else
  echo "Moving on..."
fi

clear
read -p "Do you want extra installs? like Joplin cli and lazy-vim (y/N)" bxtra

if [[ $bxtra == y ]]; then
  cd ~/Lingelo
  bash extras.sh

else
  echo "Your loss big dawg"
  sudo bash /root/Lingelo/end.sh

fi
#https://github.com/Flan-Angel/Lingelo.git

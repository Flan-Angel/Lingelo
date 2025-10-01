#!/bin/bash

echo "Specify your init system

SystemD (Used on most linux distros including Arch) = sysd 
Dinit = dn"
read binits

#systemd part
if [[ $binits == dn ]]; then
  echo "mmm Artix user huh? pretty kewl :3"

  echo "Let's start with secutity"
  # dinitctl enable apparmor

  echo "Updating ClamAV virus database"
  freshclam

  echo "Firewall setup is uhhh happening :)"
  dinitctl enable ufw
  ufw limit 22/tcp
  ufw allow 80/tcp
  ufw allow 443/tcp
  ufw default deny incoming
  ufw default allow outgoing
  dinitctl start ufw

  echo "Configuring Hardware saving stuff + Power Profiles"
  dinit enable thermald
  dinit start thermald
  dinit enable power-profiles-daemon
  dinit start power-profiles-daemon

  echo "Configuring Bluetooth"
  dinit enable bluetooth.service
  dinit start bluetooth.service

  echo "Configuring Sound"
  dinit enable pipewire-pulse
  dinit start pipewire-pulse

else
  echo "Mmm SystemD poser smh (jkjk)"
  sleep 2s

  echo "Let's start with security"
  # systemctl enable apparmor
  #do this bit

  echo "Updating ClamAV virus database"
  freshclam

  echo "Setting up firewall"
  systemctl enable ufw
  ufw limit 22/tcp
  ufw allow 80/tcp
  ufw allow 443/tcp
  ufw default deny incoming
  ufw default allow outgoing
  systemctl start ufw

  echo "Configuring Hardware saving stuff + Power Profiles"
  systemctl enable thermald
  systemctl start thermald
  systemctl enable power-profiles-daemon
  systemctl start power-profiles-daemon

  echo "Configuring Bluetooth"
  systemctl enable bluetooth.service
  systemctl start bluetooth.service

  echo "Configuring Sound"
  systemctl enable pipewire-pulse
  systemctl start pipewire-pulse
fi

#User creation
read -p "Create new user? Usually you dont use the root account (y/N)" bitch

if [[ $bitch == y ]]; then
  echo "Name your User"
  read busr
  echo "Make password for" $user
  read -s bpass
  useradd -m -g wheel -p $bpass $busr
  clear
  echo "Editing sudoers so wheel group users have sudo privilage"
  sed -i 's/# %wheel ALL=(ALL:ALL) ALL/  %wheel ALL=(ALL:ALL) ALL/' /etc/sudoers
  echo "Logging into non root user"
  su - $user

fi

if [[ $bitch == n ]]; then
  echo "Moving on..."
fi

#https://github.com/Flan-Angel/Lingelo.git

bash extras.sh

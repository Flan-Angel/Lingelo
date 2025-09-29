#!/bin/bash

echo "Name your init system

SystemD (default) = sysd 
Runit = rn"
read binits

#systemd part
if [[ $binits == rn ]]; then
  echo "mmm Artix user huh? pretty kewl :3"
  #
  #
  #
  #
  #
else
  echo "Mmm SystemD poser smh (jkjk)"
  sleep 2s

  echo "Lets start with security"
  systemctl enable apparmor
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

fi

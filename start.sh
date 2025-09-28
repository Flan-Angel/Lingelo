#!/bin/bash

clear

echo "WELCOME TO LINGELO! The all new, very specific arch auto configuration system"
echo "Which init system are you using? 

systemd 
runit 
(more coming soon :3)"
read bini

pacman -Syu --noconfirm networkmanager git base-devel sudo

#User creation
echo "Create new user? (y/n)"
read bitch

if [[ $bitch == y ]]; then
  echo "Name your User"
  read busr
  echo "Make password for" $user
  read bpass
  useradd -m -g wheel -p $bpass $busr

fi

if [[ $bitch == n ]]; then
  echo "Moving on..."
fi

#Git clone repo
echo "Cloning into Lingelo..."
cd /home/$bitch
git clone https://github.com/Flan-Angel/Lingelo.git

bash Lingelo/Packgz.sh

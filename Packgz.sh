#!/bin/bash

echo "You probably want packages for your system, so like your GUI and Security stuff"

sleep 7s

cd Lingelo
cat packages.conf
source packges.conf

pacman -S --noconfirm ${ESSEN[@]}

#Security packages
read -p "Do you want a secure system? +170 MiB (y/N)" sec

if [[ $sec == y ]]; then
  echo "Okay Pookie"
  pacman -S --noconfirm ${SECC[@]}
else
  echo "Okay... Weirdo"
fi

#hardware care packages
read -p "Do you want the laptop mode tools and other stuff that keeps your hardware safe? +1 MiB (y/N)" bhardw

if [[ $bhardw == y ]]; then
  echo "HardwareChan: Thanks for keeping me safe onee-san uwu"
  pacman -S --noconfirm ${HARDW[@]}
else
  echo "HardwareChan: Meanie :( Fuck you"
fi

#nwtwoek packages
read -p "Do you want Bluetooth and Networkmanager? +22 MiB (y/N)" blut

if [[ $blut == y ]]; then
  echo "Installing all the bluetooth and networkmanager shit"
  pacman -S --noconfirm ${CONN[@]}
else
  echo "Okay :3"
fi

#sound packages
read -p "Do you want to have sound?  (y/N)" bsnd


if [[ $bsnd == y ]]; then
  echo "K Big Dawg"
  pacman -S --noconfirm ${SOUND[@]}
else
  echo ">_<"
fi

#Text related stuff
read -p "Do you want text related stuff? Like text editors and e-book viewers +173 MiB (y/N)" btxt

if [[ $btxt == y ]]; then
  "Okay Nerd"
  pacman -S --noconfirm ${TEXT[@]}
else
  echo "Mmmmhmm."
fi

#Desktop GUI
read -p "Do you want a GUI? Fuck it, do you want uhhh four of them? +122 MiB (y/N)" bgui

if [[ $bgui == y ]]; then
  echo "Its all very minimal and we dont have gnome :3"
  pacman -S --noconfirm ${DESKT[@]}
else
  echo "This mf..."
fi

#Window manager essentials
read -p "You probably want these if you use a window manager +104 MiB (y/N)" bap

if [[ $bap == y ]]; then
  echo "Doing that"
  pacman -S --noconfirm ${GUIP[@]}
else
  echo "Coooool..."
fi

#Media stuff
read -p "Do you want media viewers/editors + fonts? +622 MiB (y/N)" bmd


if [[ $bmd == y ]]; then
  echo "Gimp and shi..."
  pacman -S --noconfirm ${MEDIA[@]}
else
  echo "Okay dawg"
fi

##cli stuff
read -p "Cool cli stuff +40 MiB (y/N)" bcli

if [[ $bcli == y ]]; then
  echo "Fetch, cbonsai and cmatrix... Plus some other stuff"
  pacman -S --noconfirm ${CLI[@]}
else
  echo "Really? Your loss bro"
fi

#bloat stuff
read -p "We got some cool extras but they are pretty heavy :( do you want them +534 MiB (y/N)" bblo

if [[ $bblo == y ]]; then
  echo "Mmm yummy disc space... shame it's all mine now"
  pacman -S --noconfirm ${BLO[@]}
else
  echo "Coolsies :3"
fi

clear
echo "Yaayyyy we are done with your package installation"
sleep 1s
echo "Do you wanna configure it with me here? Or are you a big boy that does his own configuration"
sleep 1s
echo "Only daemons and services, we dont do desktop configs in this script"
sleep 1s
read -p "(Y/n)" bconf


if [[ $bconf == n ]]; then
  echo "Okay big boy"
  #do other script
else
  echo "It's Configging time"
  bash configuration.sh

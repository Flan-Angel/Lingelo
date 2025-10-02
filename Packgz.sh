#!/bin/bash
clear
echo "You probably want packages for your system, so like your GUI and Security stuff"

sleep 2s

cd Lingelo
cat packages.conf
source packages.conf

pacman -S --noconfirm ${ESSEN[@]}

#Security packages
clear
read -p "Do you want a secure system? +170 MiB (y/N) " sec

if [[ $sec == y ]]; then
  clear
  echo "Okay Pookie"
  pacman -S --noconfirm ${SECC[@]}
else
  clear
  echo "Okay... Weirdo"
fi

#hardware care packages
clear
read -p "Do you want the laptop mode tools and other stuff that keeps your hardware safe? +1 MiB (y/N) " bhardw

if [[ $bhardw == y ]]; then
  clear
  echo "HardwareChan: Thanks for keeping me safe onee-san uwu"
  pacman -S --noconfirm ${HARDW[@]}
else
  clear
  echo "HardwareChan: Meanie :( Fuck you"
  sleep 2s
fi

#nwtwoek packages
clear
read -p "Do you want Bluetooth and Networkmanager? +22 MiB (y/N) " blut

if [[ $blut == y ]]; then
  clear
  echo "Installing all the bluetooth and networkmanager shit"
  pacman -S --noconfirm ${CONN[@]}
else
  clear
  echo "Okay :3"
  sleep 2s
fi

#sound packages
clear
read -p "Do you want to have sound?  (y/N) " bsnd

if [[ $bsnd == y ]]; then
  clear
  echo "K Big Dawg"
  pacman -S --noconfirm ${SOUND[@]}
else
  clear
  echo ">_<"
  sleep 2s
fi

#Text related stuff
clear
read -p "Do you want text related stuff? Like text editors and e-book viewers +173 MiB (y/N) " btxt

if [[ $btxt == y ]]; then
  clear
  "Okay Nerd"
  pacman -S --noconfirm ${TEXT[@]}
else
  clear
  echo "Mmmmhmm."
  sleep 2s
fi

#Desktop GUI
clear
read -p "Do you want a GUI? Fuck it, do you want uhhh four of them? +122 MiB (y/N) " bgui

if [[ $bgui == y ]]; then
  clear
  echo "Its all very minimal and we dont have gnome :3"
  pacman -S --noconfirm ${DESKT[@]}
else
  clear
  echo "This mf..."
  sleep 2s
fi

#Window manager essentials
clear
read -p "You probably want these if you use a window manager +104 MiB (y/N) " bap

if [[ $bap == y ]]; then
  clear
  echo "Doing that"
  pacman -S --noconfirm ${GUIP[@]}
else
  echo "Coooool..."
fi

#Media stuff
clear
read -p "Do you want media viewers/editors + fonts? +622 MiB (y/N) " bmd

if [[ $bmd == y ]]; then
  clear
  echo "Gimp and shi..."
  pacman -S --noconfirm ${MEDIA[@]}
else
  clear
  echo "Okay dawg"
  sleep 2s
fi

##cli stuff
clear
read -p "Cool cli stuff +40 MiB (y/N) " bcli

if [[ $bcli == y ]]; then
  echo "Fetch, and cmatrix... Plus some other stuff"
  pacman -S --noconfirm ${CLI[@]}
else
  echo "Really? Your loss bro"
fi

#bloat stuff
clear
read -p "We got some cool extras but they are pretty heavy :( do you want them +534 MiB (y/N) " bblo

if [[ $bblo == y ]]; then
  clear
  echo "Mmm yummy disc space... shame it's all mine now"
  pacman -S --noconfirm ${BLO[@]}
else
  clear
  echo "Coolsies :3"
  sleep 2s
fi

clear
echo "Yaayyyy we are done with your package installation"
sleep 1s
echo "Do you wanna configure it with me here? Or are you a big boy that does his own configuration"
sleep 1s
echo "Only daemons and services, we dont do desktop configs in this script"
sleep 1s
read -p "(Y/n) " bconf

if [[ $bconf == n ]]; then
  echo "Okay big boy"
  #do other script
else
  cd ~/Lingelo
  echo "It's Configging time"
  bash configuration.sh
fi

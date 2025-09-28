echo "You probably want packages for your system, so like your GUI and Security stuff"

sleep 7s

cd Lingelo
cat packages.conf
source packges.conf

pacman -S --noconfirm ${ESSEN[@]}

#Security packages
echo "Do you want a secure system? +170 MiB (y/N)"
read sec

if [[ $sec == y ]]; then
  echo "Okay Pookie"
  pacman -S --noconfirm ${SECC[@]}
else
  echo "Okay... Weirdo"
fi

#hardware care packages
echo "Do you want the laptop mode tools and other stuff that keeps your hardware safe? +1 MiB (y/N)"
read bhardw

if [[ $bhardw == y ]]; then
  echo "HardwareChan: Thanks for keeping me safe onee-san uwu"
  pacman -S --noconfirm ${HARDW[@]}
else
  echo "HardwareChan: Meanie :( Fuck you"
fi

#nwtwoek packages
echo "Do you want Bluetooth and Networkmanager? +22 MiB (y/N)"
read blut

if [[ $blut == y ]]; then
  echo "Installing all the bluetooth and networkmanager shit"
  pacman -S --noconfirm ${CONN[@]}
else
  echo "Okay :3"
fi

#sound packages
echo "Do you want to have sound?  (y/N)"
read bsnd

if [[ $bsnd == y ]]; then
  echo "K Big Dawg"
  pacman -S --noconfirm ${SOUND[@]}
else
  echo ">_<"
fi

#Text related stuff
echo "Do you want text related stuff? Like text editors and e-book viewers +173 MiB (y/N)"
read btxt

if [[ $btxt == y ]]; then
  "Okay Nerd"
  pacman -S --noconfirm ${TEXT[@]}
else
  echo "Mmmmhmm."
fi

#Desktop GUI
echo "Do you want a GUI? Fuck it, do you want uhhh four of them? +122 MiB (y/N)"
read bgui

if [[ $bgui == y ]]; then
  echo "Its all very minimal and we dont have gnome :3"
  pacman -S --noconfirm ${DESKT[@]}
else
  echo "This mf..."
fi

#Window manager essentials
echo "You probably want these if you use a window manager +104 MiB (y/N)"
read bap

if [[ $bap == y ]]; then
  echo "Doing that"
  pacman -S --noconfirm ${GUIP[@]}
else
  echo "Coooool..."
fi

#Media stuff
echo "Do you want media viewers/editors + fonts? +622 MiB (y/N)"
read bmd

if [[ $bmd == y ]]; then
  echo "Gimp and shi..."
  pacman -S --noconfirm ${MEDIA[@]}
else
  echo "Okay dawg"
fi

##cli stuff
echo "Cool cli stuff +40 MiB (y/N)"
read bcli

if [[ $bcli == y ]]; then
  echo "Fetch, cbonsai and cmatrix... Plus some other stuff"
  pacman -S --noconfirm ${CLI[@]}
else
  echo "Really? Your loss bro"
fi

#bloat stuff
echo "We got some cool extras but they are pretty heavy :( do you want them +534 MiB (y/N)"
read bblo

if [[ $bblo == y ]]; then
  echo "Mmm yummy disc space... shame it's all mine now"
  pacman -S --noconfirm ${BLO[@]}
else
  echo "Coolsies :3"
fi

clear
echo "Yaayyyy we are done with your package installation"
echo "Do you wanna configure it with me here? Or are you a big boy that does his own configuration"
echo "Only daemons and services, we dont do desktop configs in this script"

echo "You probably want packages for your system, so like your GUI and Security stuff"

sleep 7s

cd Lingelo
cat packages.conf
source packges.conf

pacman -S --noconfirm ${ESSEN[@]}

#Security packages
echo "Do you want a secure system? (y/n)"
read sec

if [[ $sec == y ]]; then
  pacman -S --noconfirm ${SECC[@]}

  if [[ $bini == systemd ]]; then
    echo "Setting up all the yummy security... Your firewall + Apparmor"
    sleep 2s
    systemctl enable apparmor
    systemctl start apparmor
    #configure ufw
    systemctl enable ufw
    systemctl start ufw
  fi
else
  echo "Okay... Weirdo"
fi

#hardware care packages
echo "Do you want the laptop mode tools and other stuff that keeps your hardware safe? (y/n)"
read bhardw

if [[ $bhardw == y ]]; then
  echo "HardwareChan: Thanks for keeping me safe onee-san uwu"
  pacman -S --noconfirm ${HARDW[@]}
fi

if [[ $bhardw == n ]]; then
  echo "HardwareChan: Meanie :( Fuck you"
fi

#nwtwoek packages
echo "Do you want Bluetooth and Networkmanager? (y/n)"
read blut

if [[ $blut == y ]]; then
  pacman -S --noconfirm ${CONN[@]}
fi

if [[ $blut == n ]]; then
  echo "Okay :3"
fi

#sound packages
echo "Do you want to have sound? (y/n)"
read bsnd

if [[ $bsnd == y ]]; then
  pacman -S --noconfirm ${SOUND[@]}
fi
if [[ $bsnd == n ]]; then
  echo ">_<"
fi

#Text related stuff
echo "Do you want text related stuff? Like text editors and e-book viewers"
read btxt

if [[ btxt == y ]]; then
  pacman -S --noconfirm ${TEXT[@]}
fi

if [[ btxt == n ]]; then
  echo "Mmmmhmm."
fi

#Desktop GUI

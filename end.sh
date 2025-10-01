clear
echo "Thank you for using my utility :)"
read -p "Run a system wide virus scan? This will take a bit (y/N)" bscan

if [[ $bscan == y ]]; then
  sudo freshclam
  sudo clamscan -l -r ~/Clamscan_Log.log
  clear
  sudo cat ~/Clamscan_Log.log | grep FOUND

fi

clear

echo "Goodbye User :) please rate my github repo"

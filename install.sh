#!/bin/bash

# Specify the directory you want to check
directory=/data
gunbothome=$directory/gunthy_linux
zybothome=$gunbothome/zybot
zybotmp=/opt/zybot/zyb0t-linux
zybotbin=$zybothome/zyb0t-linux
# Specify the file you want to move

# Check if the directory is not empty
if [ "$(ls -A $directory)" ]; then
  cd $gunbothome

  # Check if zybot directory available.
  if [ -d $zybothome ]; then
    # Check if we still have update
    if [ -d $zybotmp ]; then
      # Tmp File still available, move it and remove.
      echo "Updating Zybot Core"
      mv $zybotmp $zybothome
      chmod +x $zybotbin
    fi
    echo "we have zybot home $directory"
  else 
    mkdir zybot
    mv $zybotmp $zybothome
    chmod +x $zybotbin
    echo "We dont have zybot folder copying $zybotmp to $zybotbin"
  fi
  cd $zybothome
  echo "Starting Zyb0t..."
  ./zyb0t-linux
else
  # Persistence folder is empty.
  echo "Initial Run Detected!!! Please wait for gunbot to finish installing."
  echo "Then connect to your Gunbot via the web GUI and add your License & Exchanges"
  echo "Once that's complete. Restart this container."
  echo "Head on over to /data/gunthy_linux/zybot and run the zyb0t-linux executable."
  echo "cd /data/gunthy_linux/zybot"
  echo "./zyb0t-linux"
  echo "Zyb0t installer will ask you where gunbot is located."
  echo "It is located at /data/gunthy_linux"
fi
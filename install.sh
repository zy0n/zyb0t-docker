#!/bin/bash

# Specify the directory you want to check
directory=/data
gunbothome=$directory/gunthy_linux
zybothome=$gunbothome/zybot
zybotmp=/opt/zybot/zyb0t-linux
zybotbin=$zybothome/zyb0t-linux
# Specify the file you want to move
ZYBOTHASH="4fb564384a355f3f0a3f218663e2a23f-docker"


if [ -d /var/lib/dbus ]; then
  echo "Running As Usual!"

else 
  echo "UUID Not found. Replacing!"
  mkdir -p /var/lib/dbus/ && printf "${ZYBOTHASH}" > /var/lib/dbus/machine-id

fi

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
  echo "No persistence has been found, please start the containers again..."
fi
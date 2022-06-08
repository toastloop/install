#!/bin/bash
export SCRIPT="$( cd "$(dirname "$0")" ; pwd -P )"

cp pacman.conf /etc/pacman.conf

cd $HOME

#read -p 'Username: ' username
#read -sp 'Password: ' password

echo "Please choose an option:"
echo "1. Desktop"
echo "2. Server"
echo "3. Xorg"
echo "4. Minimal"
while read -p "Please select an option [1-4] " option
do
case $option in
    [1]* ) archinstall --config $SCRIPT/desktop.json --creds $SCRIPT/creds.json --disk_layouts $SCRIPT/disk.json;break;;
    [2]* ) archinstall --config $SCRIPT/server.json --creds $SCRIPT/creds.json --disk_layouts $SCRIPT/disk.json;break;;
    [3]* ) archinstall --config $SCRIPT/xorg.json --creds $SCRIPT/creds.json --disk_layouts $SCRIPT/disk.json;break;;
    [4]* ) archinstall --config $SCRIPT/minimal.json --creds $SCRIPT/creds.json --disk_layouts $SCRIPT/disk.json;break;;
    "" ) archinstall --config $SCRIPT/minimal.json --creds $SCRIPT/creds.json --disk_layouts $SCRIPT/disk.json;;
    * ) echo "Error: Please enter a number between 1 and 4.";;
esac
done
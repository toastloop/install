#!/bin/bash

read -p 'Username: ' username
read -sp 'Password: ' password

echo "Please choose an option:"
echo "1. Desktop"
echo "2. Server"
echo "3. Xorg"
echo "4. Minimal"
while read -p "Please select an option [1-4] " option
do
case $option in
    [1]* ) archinstall --config desktop.json --creds creds.json --disk_layouts disk.json;break;;
    [2]* ) archinstall --config server.json --creds creds.json --disk_layouts disk.json;break;;
    [3]* ) archinstall --config xorg.json --creds creds.json --disk_layouts disk.json;break;;
    [4]* ) archinstall --config minimal.json --creds creds.json --disk_layouts disk.json;break;;
    "" ) archinstall --config minimal.json --creds creds.json --disk_layouts disk.json;;
    * ) echo "Error: Please enter a number between 1 and 4.";;
esac
done
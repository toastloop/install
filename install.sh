#!/bin/bash

export SCRIPT="$( cd "$(dirname "$0")" ; pwd -P )"

cd $HOME

function desktop(){
    echo -e "\nPlease choose a desktop"
    echo "1. awesome"
    echo "2. bspwm"
    echo "3. budgie"
    echo "4. cinnamon"
    echo "5. cutefish"
    echo "6. deepin"
    echo "7. enlightenment"
    echo "8. gnome"
    echo "9. i3"
    echo "10. kde"
    echo "11. lxqt"
    echo "12. mate"
    echo "13. qtile"
    echo "14. sway"
    echo -e "15. xcfe4 \n"
    while read -p "Please select an option [1-15] " option
    do
        case $option in
        1 ) sed -i -e "s/kde/awesome/g" $SCRIPT/desktop.json;break;;
        2 ) sed -i -e "s/kde/bspwm/g" $SCRIPT/desktop.json;break;;
        3 ) sed -i -e "s/kde/budgie/g" $SCRIPT/desktop.json;break;;
        4 ) sed -i -e "s/kde/cinnamon/g" $SCRIPT/desktop.json;break;;
        5 ) sed -i -e "s/kde/cutefish/g" $SCRIPT/desktop.json;break;;
        6 ) sed -i -e "s/kde/deepin/g" $SCRIPT/desktop.json;break;;
        7 ) sed -i -e "s/kde/enlightenment/g" $SCRIPT/desktop.json;break;;
        8 ) sed -i -e "s/kde/gnome/g" $SCRIPT/desktop.json;break;;
        9 ) sed -i -e "s/kde/i3/g" $SCRIPT/desktop.json;break;;
        10 ) sed -i -e "s/kde/kde/g" $SCRIPT/desktop.json;break;;
        11 ) sed -i -e "s/kde/lxqt/g" $SCRIPT/desktop.json;break;;
        12 ) sed -i -e "s/kde/mate/g" $SCRIPT/desktop.json;break;;
        13 ) sed -i -e "s/kde/qtile/g" $SCRIPT/desktop.json;break;;
        14 ) sed -i -e "s/kde/sway/g" $SCRIPT/desktop.json;break;;
        15 ) sed -i -e "s/kde/xcfe4/g" $SCRIPT/desktop.json;break;;
        esac
    done
    archinstall --config $SCRIPT/desktop.json --creds $SCRIPT/creds.json --disk_layouts $SCRIPT/disk.json
}

function menu(){
    echo -e "\n\nPlease choose an option:"
    echo "1. Desktop"
    echo "2. Light"
    echo "3. Server"
    echo "4. Xorg"
    echo -e "5. Minimal\n"
    while read -p "Please select an option [1-4] " option
    do
    case $option in
        [1]* ) desktop;break;;
        [2]* ) archinstall --config $SCRIPT/light.json --creds $SCRIPT/creds.json --disk_layouts $SCRIPT/disk.json;break;;
        [3]* ) archinstall --config $SCRIPT/server.json --creds $SCRIPT/creds.json --disk_layouts $SCRIPT/disk.json;break;;
        [4]* ) archinstall --config $SCRIPT/xorg.json --creds $SCRIPT/creds.json --disk_layouts $SCRIPT/disk.json;break;;
        [5]* ) archinstall --config $SCRIPT/minimal.json --creds $SCRIPT/creds.json --disk_layouts $SCRIPT/disk.json;break;;
        "" ) archinstall --config $SCRIPT/minimal.json --creds $SCRIPT/creds.json --disk_layouts $SCRIPT/disk.json;;
        * ) echo "Error: Please enter a number between 1 and 4.";;
    esac
    done
}

function creds(){
    read -p 'Username: ' username
    read -sp 'Password: ' password

    sed -i -e "s/johndoe/$username/g" $SCRIPT/creds.json
    sed -i -e "s/test1234/$password/g" $SCRIPT/creds.json
}

function copyconf(){
    cp $SCRIPT/pacman.conf /etc/pacman.conf
}

while read -p 'Do you want to copy the pacman config? [y/N]: ' yn
do
    case $yn in
    [yY]* ) copyconf;break;;
    [nN]* ) break;;
    "" ) break;;
    * ) echo "Please enter [y/n]";;
    esac
done

while read -p 'Do you want to change the credentials? [y/N]: ' yn
do
    case $yn in
    [yY]* ) creds;break;;
    [nN]* ) break;;
    "" ) break;;
    * ) echo "Please enter [y/n]";;
    esac
done

menu
#!/bin/bash

echo -e "\e[32mWelcome to the DEV VM Installer\e[0m\n"
echo "We will now clone a Git Repository into your current working directory."
echo -n "Continue? [y/N] "

read start
if [ "$start" != "y" ] 
then
    echo -e "\e[31mAborting...\e[0m\n"
    exit 0
fi 

echo
echo "First we need to install Git. We'll need your admin password for that..."
sudo apt-get -yq install git-core

echo
echo "Cloning the repository."
git clone https://source.ctp.com/java/vm_setup_scripts.git
if [ $? -ne 0 ]
then
    echo -e "\e[31mClone failed - wrong credentials?\e[0m Exiting..."
    exit 1
fi

echo -e "\e[32mGit Repository successfully cloned.\e[0m Starting the setup."

cd vm_setup_scripts
./setup.sh

if [ $? -eq 0 ]
then
    echo -e "\e[32mDEV VM successfully initialized! Start installing by running install.sh with the software profile you need in the vm_setup_scripts directory.\e[0m"
fi


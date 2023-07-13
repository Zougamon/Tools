#!/bin/bash
if [[ $EUID -ne 0 ]]; then
  echo "This must be run with root priviledges..."
  sleep 1
  echo "Try Harder"
  exit 1
fi 

cat << "EOF"
██     ██ ███████ ██      ██████  ██████  ███    ███ ███████ 
██     ██ ██      ██     ██      ██    ██ ████  ████ ██      
██  █  ██ █████   ██     ██      ██    ██ ██ ████ ██ █████   
██ ███ ██ ██      ██     ██      ██    ██ ██  ██  ██ ██      
 ███ ███  ███████ ███████ ██████  ██████  ██      ██ ███████ 
                                                             
  ▄████  ██░ ██  ▒█████    ██████ ▄▄▄█████▓
 ██▒ ▀█▒▓██░ ██▒▒██▒  ██▒▒██    ▒ ▓  ██▒ ▓▒
▒██░▄▄▄░▒██▀▀██░▒██░  ██▒░ ▓██▄   ▒ ▓██░ ▒░
░▓█  ██▓░▓█ ░██ ▒██   ██░  ▒   ██▒░ ▓██▓ ░ 
░▒▓███▀▒░▓█▒░██▓░ ████▓▒░▒██████▒▒  ▒██▒ ░ 
 ░▒   ▒  ▒ ░░▒░▒░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░  ▒ ░░   
  ░   ░  ▒ ░▒░ ░  ░ ▒ ▒░ ░ ░▒  ░ ░    ░    
░ ░   ░  ░  ░░ ░░ ░ ░ ▒  ░  ░  ░    ░      
      ░  ░  ░  ░    ░ ░        ░           
                                           
EOF

################
# Update repos #
################

echo "Updating package repos..."
apt update > /dev/null 2>&1
echo "Succcess"


####################################
# Installing the apt install Tools #
####################################

applications=("seclists" "bloodhound" "gobuster" "gedit") 

for app in "${applications[@]}"; do
  echo "Installing $app..."
  apt install -y "$app" > /dev/null 2>&1
  echo "Installation of $app complete."
done

###########################
# Downloads from internet #
###########################

# Download sharphound from github
echo "Downloading SharpHound..."
for file in $(cat ActiveDirectory/SharpHound/SharpHoundv1.1.1.txt); do 
  wget -P ActiveDirectory/SharpHound ${file} > /dev/null 2>&1; 
done
echo "Download complete."
echo "Unzipping downloaded folder..."
unzip ActiveDirectory/SharpHound/SharpHound-v1.1.1.zip -d ActiveDirectory/SharpHound > /dev/null 2>&1
echo "Unzip complete."

# downloading Impackets
echo "Downloading impacket..."
for file in $(cat impacket/impacketv0.10.0.txt); do 
  wget -P impacket ${file} > /dev/null 2>&1; 
done
echo "Download complete."
echo "Unzipping downloaded folder..."
tar -xf impacket/impacket-0.10.0.tar.gz -C impacket > /dev/null 2>&1
echo "Unzip complete. Further action will be required for impacket."


# Downloading Certipy from github
echo "Downloading Certipy..."
for file in $(cat ActiveDirectory/Certipy.txt); do 
  git clone ${file} ActiveDirectory> /dev/null 2>&1; 
done
echo "Download complete. Further action will be required to install Certipy."

# Download LdapRelayScan from github
echo "Downloading LdapRelayScan..."
for file in $(cat ActiveDirectory/LdapRelayScan.txt); do 
  git clone ${file} ActiveDirectory> /dev/null 2>&1; 
done
echo "Download complete."

# Download PetitPotam
echo "Downloading PetitPotam..."
for file in $(cat ActiveDirectory/PetitPotam.txt); do 
  git clone ${file} ActiveDirectory> /dev/null 2>&1; 
done
echo "Download complete."


echo ""
echo "Installation of tools complete. Happy Hacking!"

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

#update repos
echo "Updating package repos..."
apt update > /dev/null 2>&1
echo "Succcess"

# Installing the Tools

applications=("seclists" "bloodhound" "gobuster" "gedit") 

for app in "${applications[@]}"; do
  echo "Installing $app..."
  apt install -y "$app" > /dev/null 2>&1
  echo "Installation of $app complete."
done

echo ""
echo "Installation of tools complete. Happy Hacking!"

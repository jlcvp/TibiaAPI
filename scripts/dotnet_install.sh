#!/bin/bash
# Helper script by Leu(jlcvp@github) to install dotnet core 3.1

# Colors
NC='\e[0m'
RED='\e[0;31m'
GREEN='\e[0;32m'
ORANGE='\e[0;33m'
BLUE='\e[0;34m'
PURPLE='\e[0;35m'
CYAN='\e[0;36m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTRED='\e[1;31m'
LIGHTGREEN='\e[1;32m'
YELLOW='\e[1;33m'
LIGHTBLUE='\e[1;34m'
LIGHTPURPLE='\e[1;35m'
LIGHTCYAN='\e[1;36m'
WHITE='\e[1;37m'

spinner()
{
    local pid=$1
    local delay=0.1
    local spinstr='\|/|'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf "[${LIGHTBLUE}%c${NC}]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

if [[ "$EUID" != 0 ]]; then
   printf "Please run this script using ${GREEN}sudo${NC}\n"
   exit 1;
fi

if ! command -v dotnet &> /dev/null
then
    
    printf "Downloading ${RED}M${GREEN}i${BLUE}c${YELLOW}r${RED}o${GREEN}s${BLUE}o${YELLOW}f${RED}t${NC} Packages..."
    (wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb &> /dev/null) &
    spinner $!
    printf "${GREEN}OK${NC}\n"
    printf "Installing ${RED}M${GREEN}i${BLUE}c${YELLOW}r${RED}o${GREEN}s${BLUE}o${YELLOW}f${RED}t${NC} Packages... "
    (dpkg -i packages-microsoft-prod.deb &> /dev/null) &
    spinner $!
    rm -f packages-microsoft-prod.deb
    printf "${GREEN}OK${NC}\n"
    printf "Installing apt-transport-https... "
    (apt update &> /dev/null; apt install -y apt-transport-https &> /dev/null; apt update &> /dev/null) &
    spinner $!
    printf "${GREEN}OK${NC}\n"
    printf "Installing .NET core SDK 3.1... "
    (apt install -y dotnet-sdk-3.1 &> /dev/null) &
    spinner $!
    if ! command -v dotnet &> /dev/null
    then
        printf "${RED} ERROR!${NC}\nInstallation FAILED, verify your network connection and try again."
        exit 1;
    else
        printf "${GREEN}OK${NC}\n\n"
        echo ".NET core SDK installed successfully!"
    fi
else
    echo ".NET core is already installed"
fi

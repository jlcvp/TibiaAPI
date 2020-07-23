#!/bin/bash
# Colors
NOCOLOR='\e[0m'
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

printf "${WHITE}Record Server Start...\n"
printf "${NOCOLOR}Remember to set ${GREEN}login url${NOCOLOR} and ${GREEN}open tibia RSA${NOCOLOR} in your client\n"
sleep 1
printf "To terminate this program press Ctrl+C\n${PURPLE}--- Record Server Listening on ${YELLOW}localhost${NOCOLOR} port ${LIGHTBLUE}7171 ${PURPLE}--- ${NOCOLOR}\n"
dotnet runtime/Record.dll

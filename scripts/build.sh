LANG=en_US.UTF-8
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
    local delay=0.3
    local spinstr="\|/|"
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf "[${LIGHTBLUE}%c${NC}]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}



if ! command -v dotnet &> /dev/null
then
  printf "dotnet command not found!\nInstall it using: \e[1;33msudo ./dotnet_install.sh\e[0m\n"
  exit 1;
fi

printf "${ORANGE}Updating project dependencies... "
(dotnet restore .. &> /dev/null) &
spinner $!
printf "${GREEN}OK${NC}\n"
printf "${ORANGE}Compiling TibiaAPI Runtime Apps... "
rm -rf runtime/
(dotnet publish -c Release -o runtime/ .. &> /dev/null) &
spinner $!
printf "${YELLOW}Done${NC}\n"


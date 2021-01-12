#!bin/bash
#Coded by Anubhav Kashyap
#Don't Try to Steal it Bitch !!!
apt install figlet
clear
echo -e "\033[1;93m ‎"
figlet -f slant HostOnion
sleep 1
echo ""
echo -e "              \033[1;91m  Author   \033[1;90m: \033[1;95mAnubhav Kashyap"
echo -e "              \033[1;93m  Group    \033[1;90m: \033[1;96mDeepweb Shadows"
echo -e "              \033[1;92m Instagram \033[1;90m: \033[1;94m@anubhavanonymous"
echo -e "              \033[1;97m  Github   \033[1;90m: \033[1;93mgithub.com/anubhavanonymous"
echo ""
echo -e ""
sleep 1
echo -e $'\e[1;33m[\e[0m\e[1;77m HostOnion \e[0m\e[1;33m]\e[0m\e[1;32m # Installing Dependencies ! \e[0m'
apt install tor -y
apt install wget -y
apt install php -y
apt install nano
rm index.html
echo -e $'\e[1;33m[\e[0m\e[1;77m HostOnion \e[0m\e[1;33m]\e[0m\e[1;32m ## Generating Webpage \e[0m'
wget https://raw.githubusercontent.com/Deauthxploit/Nothing_much/main/index.html
echo -e $'\e[1;33m[\e[0m\e[1;77m HostOnion \e[0m\e[1;33m]\e[0m\e[1;32m # Enter Details to display on the Webpage \e[0m'
echo ""
#Enter Full Name
search="%nfame"
read -p "Enter Your Full Name >>> " replace
if [[ $search != "" && $replace != "" ]]; then
sed -i "s/$search/$replace/gi" index.html
fi
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Enter Nick Name
search="%criets"
read -p "Enter Your Nick Name >>> " replace
if [[ $search != "" && $replace != "" ]]; then
sed -i "s/$search/$replace/gi" index.html
fi
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Enter Main Text
search="%Maintext"
read -p "Enter the Main Message >>> " replace
if [[ $search != "" && $replace != "" ]]; then
sed -i "s/$search/$replace/gi" index.html
fi
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#-----------------------------------------------

echo ""                                                                                                                              echo ""                                                                                                                              php="$(ps -efw | grep php | grep -v grep | awk '{print $2}')"                                                                        ngrok="$(ps -efw | grep ngrok | grep -v grep | awk '{print $2}')"
kill -9 $php > /dev/null 2>&1
kill -9 $tor > /dev/null 2>&1

echo ""
echo -e $'\e[1;33m[\e[0m\e[1;77m HostOnion \e[0m\e[1;33m]\e[0m\e[1;32m ## Starting Php Server \e[0m'
                  php -S 127.0.0.1:8080 > /dev/null 2>&1 &
                  sleep 3
echo -e "\033[1;95mPhp server is up"
echo -e "\033[1;96mYou can check your server by accessing localhost:8080"
#-----------------------------------------------
sleep 1
echo -e $'\e[1;33m[\e[0m\e[1;77m HostOnion \e[0m\e[1;33m]\e[0m\e[1;32m # Configuring Files ! \e[0m'
cd /data/data/com.termux/files/usr/var/lib/
mkdir tor
cd tor
mkdir hidden_service
cd /data/data/com.termux/files/usr/var/lib/tor/hidden_service
rm hostname
cd /data/data/com.termux/files/usr/etc/tor
rm torrc
echo -e $'\e[1;33m[\e[0m\e[1;77m HostOnion \e[0m\e[1;33m]\e[0m\e[1;32m ## Setting up TOR \e[0m'
wget https://raw.githubusercontent.com/Deauthxploit/Nothing_much/main/torrc
tor &
sleep 60
cd /data/data/com.termux/files/usr/var/lib/tor/hidden_service
echo ""
echo -e $'\e[1;33m[\e[0m\e[1;77m HostOnion \e[0m\e[1;33m]\e[0m\e[1;32m # Your Onion Site is Ready !! \e[0m'
echo ""
echo -e "\e[91m "
cat hostname
echo -e "\e[39m "
echo ""
echo -e $'\e[1;33m[\e[0m\e[1;77m HostOnion \e[0m\e[1;33m]\e[0m\e[1;32m ## Press ctrl + c to Exit \e[0m'
echo ""
while true
do
sleep 5
done

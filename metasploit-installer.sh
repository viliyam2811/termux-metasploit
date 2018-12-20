#!/data/data/com.termux/files/usr/bin/bash

clear
echo "###########"
echo "Script 	: metasploit-installer.sh"
echo "Creator	: Viliyam Vasava"
echo "Youtube	: https://www.youtube.com/channel/UCPZ-jgYuRVZ8Mq9wCn1xepw"
echo "###########"

sleep 2
echo ""
echo ">> Meatasploit Framework Needs Atleast 1GB Storage."
echo ""

option=0

while [ $option -ne 13 ]
do
	echo "*** Memu ***"
	echo "1. Install Metasploit Framework."
	echo "2. Cancle"
	echo "************"

	read -p "Enter Option > " option
	
	if [ $option -eq 1 ]
	then
		clear
#Install Ruby
		echo "Installing Base Environment"
		echo ""
		sleep 2
		pkg install ruby -y
		gem install lolcat

#Install Other Required Packeges
		echo "Installing Other Required Packeges" |lolcat
		echo ""
		sleep 1
		pkg install autoconf bison clang coreutils curl findutils git apr apr-util libffi-dev libgmp-dev libpcap-dev postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev ncurses-dev pkg-config make ruby-dev termux-tools ncurses ncurses-utils termux-exec -y |lolcat

#Install Bundle
		echo "Installing Bundle" |lolcat
		echo ""
		sleep 1
		gem install bundler |lolcat

#Install nokogiri Gem
		echo "Installing Nokogiri" |lolcat
		echo ""
		sleep 1
		gem install nokogiri -- --use-system-libraries |lolcat



#Install GIT
		echo "Installing GIT" |lolcat
		echo ""
		sleep 1
		pkg install git -y |lolcat

#Clone Metasploit-Framework
		echo "Downloading Metasploit-Framework" |lolcat
		echo ""
		sleep 1
		cd $HOME
		git clone https://github.com/rapid7/metasploit-framework |lolcat
		
#Install Required Gems
		echo "Installing -j5" |lolcat
		echo ""
		sleep 1
		cd $HOME/metasploit-framework
		bundle install -j5 |lolcat
		
#Fix Termux Shebang
		echo "Fixing Termux Shebang" |lolcat
		echo ""
		sleep 1
		$PREFIX/bin/find -type f -executable -exec termux-fix-shebang \{\} \; |lolcat
		

#Setting up Database
		echo "Setting up Database" |lolcat
		echo ""
		sleep 1
		cd $HOME/metasploit-framework/config
		
		curl -LO https://Auxilus.github.io/database.yml 

		mkdir -p $PREFIX/var/lib/postgresql 

		initdb $PREFIX/var/lib/postgresql 
		pg_ctl -D $PREFIX/var/lib/postgresql start 

		createuser msf 
		createdb msf_database

#Install termux-metasploit-helper
		echo "Installing termux-metasploit-helper commands"
		echo ""
		sleep 1
		cd $HOME
		
		git clone https://github.com/viliyam2811/termux-metasploit-helper
		cd termux-metasploit-helper
		
		chmod +x *
		
		./init
		
		option=13
	elif [ $option -eq 2 ]
	then
		clear

		echo "Installation Cancelled"
		echo "Exiting..."

		sleep 4

		option=13

		clear
	else
		clear
		echo "Invalid Option..."
		option=0
	fi
done











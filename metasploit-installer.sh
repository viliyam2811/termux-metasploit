#/data/data/com.termux/files/usr/bin/sh

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
		sleep 1

		pkg install ruby -y
		gem install lolcat

#Install Bundle
		sleep 1
		echo "Installing Bundle" |lolcat
		gem install bundler |lolcat

#Install nokogiri Gem
		sleep 1
		echo "Installing Nokogiri" |lolcat
		gem install nokogiri -- --use-system-libraries |lolcat

#Install Required Gems
		sleep 1
		echo "Installing -j5" |lolcat
		bundle install -j5 |lolcat

#Install GIT
		sleep 1
		echo "Installing GIT" |lolcat
		pkg install git -y |lolcat

#Clone Metasploit-Framework
		sleep 1
		echo "Downloading Metasploit-Framework" |lolcat
		git clone https://github.com/rapid7/metasploit-framework -y |lolcat
		
#Install Other Required Packeges
		sleep 1
		echo "Installing Other Required Packeges" |lolcat
		pkg install autoconf bison clang coreutils curl findutils git apr apr-util libffi-dev libgmp-dev libpcap-dev postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev ncurses-dev pkg-config make ruby-dev termux-tools ncurses ncurses-utils termux-exec -y |lolcat

#Fix Termux Shebang
		sleep 1
		echo "Fixing Termux Shebang" |lolcat
		$PREFIX/bin/find -type f -executable -exec termux-fix-shebang \{\} \; |lolcat
		

#Setting up Database
		sleep 1
		echo "Setting up Database" |lolcat
		cd $HOME/metasploit-framework/config
		
		curl -LO https://Auxilus.github.io/database.yml 

		mkdir -p $PREFIX/var/lib/postgresql 

		initdb $PREFIX/var/lib/postgresql 
		pg_ctl -D $PREFIX/var/lib/postgresql start 

		createuser msf 
		createdb msf_database

		cd $HOME

		


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









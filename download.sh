#!/bin/bash
#
# Download Backups via FTP
# for Ubuntu Linux
#
# Script by Christoph Daniel Miksche
# License: GNU General Public License
#
# Contact:
# >> http://christoph.miksche.org
# >> Twitter: CMiksche
# >> GitHub: CMiksche
#
# Run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Zeiten
datum=`date -I`;
jahr=`date "+%G"`;
monat=`date "+%m"`;
tag=`date "+%d"`;
wochentag=`date "+%a"`;

# Install NcFTP
sudo apt-get install ncftp
# Array of Server Names
ServerNameArray=("SERVER1" "SERVER2")
# Array of Server Data, 1. SERVER1, 2. SERVER2
ServerDataArray=("-u USERNAME1 -p PASSWORD1 IP1" "-u USERNAME2 -p PASSWORD2 IP2") 
# Local Dir
localdir="/media/FREIGABE/backup/server"
# Server Dir
serverdir="BACKUPPFAD"

# Counter
number=0

for name in "${ServerNameArray[@]}"
        do

                ncftpget -R ${ServerDataArray[number]} "$localdir/$name/$jahr/$monat" "$serverdir/$name/$jahr/$monat/$tag"

                ((number++))
done

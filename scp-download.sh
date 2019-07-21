#!/bin/bash
#
# Download Backups via SCP
# for Linux
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
tag=`date "+%d"`

# Server Name
name=""
# Server Port
port=""
# Username
username=""
# IP
ip=""
# Local Dir
localdir=""
# Server Dir
serverdir=""

# SCP Copy
scp -r -P $port $username@$ip:"$serverdir/$name/$jahr/$monat/$tag" "$localdir/$name/$

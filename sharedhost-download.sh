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
ServerNameArray=("SERVERDOMAIN")
# Array of Server Data
ServerDataArray=("-u USERNAME -p PASSWORD SERVER")
# Local Dir
localdir="LOCALDIR"

# Counter
number=0

for name in "${ServerNameArray[@]}"
        do

                ncftpget -R ${ServerDataArray[number]} "$localdir/$name/$jahr/$monat/$tag/ftp" "/"

                ((number++))
done

# Packen
tar -zcf $localdir/$name/$jahr/$monat/$tag/data.tgz $localdir/$name/$jahr/$monat/$tag/ftp
# Dateien entfernen
rm -rf $localdir/$name/$jahr/$monat/$tag/ftp

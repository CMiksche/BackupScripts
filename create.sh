#!/bin/bash
#
# Create Backups
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
# Zeiten
datum=`date -I`;
jahr=`date "+%G"`;
monat=`date "+%m"`;
tag=`date "+%d"`;
wochentag=`date "+%a"`;

# Verzeichnisse anlegen

if [ ! -d "/media/FREIGABE/backup/server" ]
        then
                mkdir /media/FREIGABE/backup/server
fi

if  [ ! -d "/media/FREIGABE/backup/server/HOSTNAME" ]
        then
                mkdir /media/FREIGABE/backup/server/HOSTNAME
fi

if [ ! -d "/media/FREIGABE/backup/server/HOSTNAME/$jahr" ]
        then
                mkdir /media/FREIGABE/backup/server/HOSTNAME/$jahr
fi

if [ ! -d "/media/FREIGABE/backup/server/HOSTNAME/$jahr/$monat" ]
        then
                mkdir /media/FREIGABE/backup/server/HOSTNAME/$jahr/$monat
fi

if [ ! -d "/media/FREIGABE/backup/server/HOSTNAME/$jahr/$monat/$tag" ]
        then
                mkdir /media/FREIGABE/backup/server/HOSTNAME/$jahr/$monat/$tag
fi

# Backup von Daten anlegen
if [ $wochentag == "Sa" ] # Wenn Samstag ist
        then
                tar -zcf /media/FREIGABE/backup/server/HOSTNAME/$jahr/$monat/$tag/data.tgz /var/www
fi

if [ $wochentag == "Sat" ] # Wenn Samstag ist
        then
                tar -zcf /media/FREIGABE/backup/server/HOSTNAME/$jahr/$monat/$tag/data.tgz /var/www
fi

# Backup von Datenbank anlegen

mysqldump --all-databases -u USERNAME --password=PASSWORD --events | gzip >/media/FREIGABE/backup/server/HOSTNAME/$jahr/$monat/$tag/db.sql.gz

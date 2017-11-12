#!/bin/bash

#
# Setting Needed Variables
azureconnstr="../../data/mysql/MYSQLCONNSTR_localdb.txt"
azurehosturl="http://"$(env | grep WEBSITE_HOSTNAME | sed -e "s/.*=\(.*\)/\1/")"/"

#
# Additional variables
pname="$0"

#
# Logging it is
function log() {
    tm=$(date '+%h %d %H:%M:%S')       
    echo "$tm $pname: $1" >> init.log
}

#
# Is MySQL started
while [ ! -f $azureconnstr ]
do
    exec=$(curl "$azurehosturl")
    log $exec
    log "Server not active yet."
done

#
# Getting values
log "Server is started, gathering details."

content=$(cat $azureconnstr)
re="[:]([0-9]+).*=(.*)$"

if [[ "$content" =~ $re ]]
then
    database_port="${BASH_REMATCH[1]}"
    database_pass="${BASH_REMATCH[2]}"
fi

#
# Replace Strings
log "Replacing strings in config file."
exec=$(sed -e "s/replace-password/"$database_pass"/g" -e "s/replace-port/"$database_port"/g" init/config.production.json > config.production.json)

#
# Let Node.js help us with this... :D
log "Check whether DB is online and get the location of the bin."
result=$(node init/checkDatabase.js)

if [ "$result" = "false" ]
then
    log "Database not found, fixing that shit!"
    bin=$(node init/getDatabaseBinary.js)
    exec=$("$bin" -P$database_port -uazure -p"$database_pass" < init/cleanDatabase.sql)
else
    log "Database is initialized already!"
fi
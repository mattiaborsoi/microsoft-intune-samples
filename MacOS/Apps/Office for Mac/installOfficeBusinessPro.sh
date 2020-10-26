#!/bin/bash
#set -x

############################################################################################
##
## Script to install latest Microsoft Office Business Pro for Mac from CDN Servers
## includes - Outlook, Word, Excel, PowerPoint, OneDrive, OneNote and Teams
##
###########################################

# Define variables
##############################

tempdir="/tmp"
tempfile="/tmp/office.pkg"
weburl="https://go.microsoft.com/fwlink/?linkid=854187"   # This is where the script starts querying for the latest Office install files from CDN
localcopy="http://192.168.68.150/MAU/OfficeBusinessPro.pkg"   # This is your local copy of the OfficeBusinessPro.pkg file. You need to handle this independently
appname="Office Business Pro for Mac"
log="/var/log/installofficebusinesspro.log"

# start logging

exec 1>> $log 2>&1

echo ""
echo "##############################################################"
echo "# $(date) | Starting install of $appname"
echo "############################################################"
echo ""

consoleuser=$(ls -l /dev/console | awk '{ print $3 }')

echo "$(date) | logged in user is" $consoleuser

#
# Check to see if we can access our local copy of Office
#
curl -L -f -o $tempfile $localcopy
if [ $? == 0 ]; then

     echo "$(date) | Local copy of $appname downloaded at $tempfile"

else

    echo "$(date) | Couldn't find local copy of $appname, need to fetch from CDN"

    echo "$(date) | Downloading Manifest"
    curl -L -o $tempdir/officemanifest.xml $weburl

    if [ $? == 0 ]; then
         echo "$(date) | Success"
    else
         echo "$(date) | Failure"
         exit 3
    fi

    echo "$(date) | Determining $appname CDN url"
    url="$(echo "cat /plist[@version="1.0"]//array[1]/dict[1]/string[2]/text()[1]" | xmllint --nocdata --shell $tempdir/officemanifest.xml | sed '1d;$d')"

    if [ $? == 0 ]; then
         echo "$(date) | Success"
    else
         echo "$(date) | Failure"
         exit 4
    fi

    echo "$(date) | Downloading $appname from CDN"
    curl -L -o $tempfile $url

    if [ $? == 0 ]; then
         echo "$(date) | Success"
    else
         echo "$(date) | Failure"
         exit 5
    fi

fi

echo "$(date) | Installing $appname"
installer -pkg $tempfile -target /Applications

if [ $? == 0 ]; then
     echo "$(date) | Success"
else
     echo "$(date) | Failure"
     exit 6
fi

echo "$(date) | Removing tmp files"
rm -rf $tempfile
rm -rf $tempdir/officemanifest.xml

#!/bin/bash
#set -x

############################################################################################
##
## Script to download and run Paul Bowdens MailtoOutlook tool
## this will change the default e-Mail client on the Mac to Outlook
##
###########################################

# Define variables

tempdir="/tmp"
tempfile="/tmp/MailToOutlook.pkg"
weburl="https://macadmins.software/tools/MailToOutlook.pkg"
appname="MailToOutlook"
log="/var/log/MailToOutlook.log"

# start logging

exec 1>> $log 2>&1

# Begin Script Body

echo ""
echo "##############################################################"
echo "# $(date) | Starting install of $appname"
echo "############################################################"
echo ""


echo "$(date) | Downloading $appname"
curl -L -f -o $tempfile $weburl
if [ "$?" = "0" ]; then
   echo "$(date) | $appname downloaded to $tempfile"
else
   echo "$(date) | Failed to download from $weburl"
   exit 1
fi

echo "$(date) | Running $appname"
installer -pkg $tempfile -target /Applications
if [ "$?" = "0" ]; then
   echo "$(date) | $appname downloaded to $tempfile"
else
   echo "$(date) | Failed to download from $weburl"
   exit 2
fi

#!/bin/bash
#set -x

############################################################################################
##
## Script to download latest gitHub Desktop for macOS
##
###########################################

# Define variables

tempdir="/tmp"
tempfile="/tmp/GitHubDesktop.zip"
weburl="https://central.github.com/deployments/desktop/desktop/latest/darwin"
appname="GitHub Desktop"
log="/var/log/installgithubdesktop.log"

# start logging

exec 1>> $log 2>&1

# Begin Script Body

echo ""
echo "##############################################################"
echo "# $(date) | Starting install of $appname"
echo "############################################################"
echo ""

# Let's download the files we need and attempt to install...

echo "$(date) | Downloading $appname"
curl -L -f -o $tempfile $weburl
if [ "$?" = "0" ]; then
   echo "$(date) | $appname downloaded to $tempfile"
else
   echo "$(date) | Failed to download from $weburl"
   exit 1
fi

echo "$(date) | Installing $appname"
cd $tempdir
unzip $tempfile
if [ "$?" = "0" ]; then
   echo "$(date) | $tmpfile unzipped"
else
   echo "$(date) | failed to unzip $tmpfile"
   exit 2
fi

mv -f "GitHub Desktop.app" /Applications
if [ "$?" = "0" ]; then
   echo "$(date) | $appname moved into /Applications"
else
   echo "$(date) | failed to move $appname to /Applications"
   exit 3
fi

echo "$(date) | Fix up permissions"
sudo chown -R root:wheel /Applications/VOX.app
if [ "$?" = "0" ]; then
   echo "$(date) | correctly applied permissions to $appname"
else
   echo "$(date) | failed to apply permissions to $appname"
   exit 4
fi

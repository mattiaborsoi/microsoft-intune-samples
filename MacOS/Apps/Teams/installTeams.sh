#!/bin/bash
#set -x

#############################################################
##
## Script to download latest Microsoft Teams app for macOS
##
#############################################################



# Define variables

tempfile="/tmp/teams.pkg"
weburl="https://go.microsoft.com/fwlink/?linkid=869428"
appname="Microsoft Teams"
log="/var/log/installteams.log"

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

echo "$(date) | Installing $appname"
installer -dumplog -pkg $tempfile -target /Applications
if [ "$?" = "0" ]; then
   echo "$(date) | $appname Installed"
   echo "$(date) | Cleaning Up"
   rm -rf $tempfile
   exit 0
else
  # Something went wrong here, either the download failed or the install Failed
  # intune will pick up the exit status and the IT Pro can use that to determine what went wrong.
  # Intune can also return the log file if requested by the admin
   echo "$(date) | Failed to install $appname"
   exit 1
fi

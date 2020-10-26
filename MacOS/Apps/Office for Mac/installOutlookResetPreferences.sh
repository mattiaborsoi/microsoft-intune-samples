#!/bin/bash
#set -x

############################################################################################
##
## Script to download and install OutlookResetPreferences app
##
###########################################

# Set script variables
appname="OutlookResetPreferences"
tempdir="/tmp"
targetapp="/Applications/Utilities/OutlookResetPreferences.app"


# Let's check to see if SetDefaultMailApp is already installed...
if [[ -a $targetapp ]]; then
  echo "$appname already installed, nothing to do here"
  exit 0
else
  echo "Downloading $appname"
  curl -L -o "$tempdir/$appname.zip" 'https://download.microsoft.com/download/6/C/3/6C3CF698-61C1-4A6D-9F15-104BE03BC303/OutlookResetPreferences.zip'
  cd "$tempdir"
  unzip -o "$appname.zip"

  echo "Moving $appname to Applications folder"
  mv -f "$tempdir/$appname.app" $targetapp

  echo "Fix up permissions"
  sudo chown -R root:wheel "$targetapp"

  echo "Cleaning up tmp files"
  rm -rf "$tempdir/$appname.zip"

fi

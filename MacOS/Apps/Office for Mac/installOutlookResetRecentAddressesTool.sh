#!/bin/bash
#set -x

############################################################################################
##
## Script to download and install OutlookResetRecentAddresses app
##
###########################################


# Set script variables
appname="OutlookResetRecentAddresses"
tempdir="/tmp"
targetapp="/Applications/Utilities/OutlookResetRecentAddresses.app"


# Let's check to see if SetDefaultMailApp is already installed...
if [[ -a $targetapp ]]; then
  echo "$appname already installed, nothing to do here"
  exit 0
else
  echo "Downloading $appname"
  curl -L -o "$tempdir/$appname.zip" 'https://download.microsoft.com/download/D/B/D/DBDE37DD-7955-47A6-8E1A-C993F91C5753/OutlookResetRecentAddresses.zip'
  cd "$tempdir"
  unzip -o "$appname.zip"

  echo "Moving $appname to Applications folder"
  mv -f "$tempdir/$appname.app" $targetapp

  echo "Fix up permissions"
  sudo chown -R root:wheel "$targetapp"

  echo "Cleaning up tmp files"
  rm -rf "$tempdir/$appname.zip"

fi

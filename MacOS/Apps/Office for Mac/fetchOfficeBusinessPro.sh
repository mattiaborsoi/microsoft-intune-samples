#!/bin/bash
#set -x

############################################################################################
##
## Script to download a local copy of the Office Business Pro install files for Mac
## includes - Outlook, Word, Excel, PowerPoint, OneDrive, OneNote and Teams
##
###########################################

# Define variables
##############################
tempdir="/tmp"
weburl="https://go.microsoft.com/fwlink/?linkid=854187"

echo "$(date) | Downloading Manifest"
curl -L -o $tempdir/officemanifest.xml $weburl

echo "$(date) | Determining CDN url"
url="$(echo "cat /plist[@version="1.0"]//array[1]/dict[1]/string[2]/text()[1]" | xmllint --nocdata --shell $tempdir/officemanifest.xml | sed '1d;$d')"

echo "$(date) | Downloading Office from CDN"
curl -L -o /Library/WebServer/Documents/OfficeBusinessPro.pkg $url

#!/bin/bash
#set -x

############################################################################################
##
## Script to trigger scheduled MDATP scan
##
###########################################

# Define variables
log="/var/log/mdatpscheduledscan.log"
appname="Scheduled MDATP Scan"
exec 1>> $log 2>&1

echo ""
echo "##############################################################"
echo "# $(date) | Starting $appname"
echo "############################################################"
echo ""

/usr/local/bin/mdatp --scan --quick

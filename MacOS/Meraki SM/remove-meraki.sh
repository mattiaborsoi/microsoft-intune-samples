#!/bin/sh
#!/usr/bin/env bash 
## Remove Existing Meraki Components and Unenroll MDM

## @@ ADMIN NOTE @@
# First make sure that the s/n of the device is not 
# assigned to Meraki MDM via business.apple.com
# then run this script to remove any trace left of 
# the Meraki agent, and the management profile

## @@ END USER NOTE @@
# Use this script to remove any trace of 
# the Meraki agent, and the management profile.

# You can also copy the below lines and paste them on Terminal

launchctl unload /Library/LaunchDaemons/com.meraki.agentd.plist
/bin/rm -f /usr/sbin/m_agent /usr/sbin/m_agent_upgrade
/bin/rm -rf '/Library/Application Support/Meraki/'
/bin/rm -f /Library/LaunchDaemons/com.meraki.agentd.plist
/usr/bin/profiles -R -p com.meraki.sm.mdm

exit 0
exit 1
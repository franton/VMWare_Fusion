#!/bin/bash

# Casper EA to find and report vmware fusion serial number.
# This is known to work on Fusion v5 to v8. Other versions not guaranteed.

# Author      : contact@richard-purves.com

# Based on https://communities.vmware.com/thread/493032?start=0&tstart=0
# and from a request by Quovadimus on MacAdmin Slack.

# Has VMWare Fusion actually been installed?

if [ ! -d /Applications/VMware\ Fusion.app ];
then
    echo "<result>Not Installed</result>"
    exit 0
fi

# Read the serial number from the computer and report it back to the JSS

serial=$( grep "Serial" /Library/Preferences/VMware\ Fusion/license-fusion-* | awk -F'"' '{print $2}' )

echo "<result>$serial</result>

exit 0

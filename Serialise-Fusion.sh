#!/bin/bash

# Script to grab and serialise vmware fusion

# Author      : contact@richard-purves.com

# Set up needed variables here

udid=$( ioreg -rd1 -c IOPlatformExpertDevice | awk '/IOPlatformUUID/ { split($0, line, "\""); printf("%s\n", line[4]); }' )
apiurl=`/usr/bin/defaults read /Library/Preferences/com.jamfsoftware.jamf.plist jss_url`
apiuser="apiuser"
apipass=""

# Has VMWare Fusion actually been installed?

if [ ! -x /Applications/VMware\ Fusion.app/Contents/Library/Initialize\ VMware\ Fusion.tool ];
then
    echo "Error: VMware Fusion tool is not executable."
	exit 1
fi

# Grab user info from extension attribute for target computer and process.

# Retrieve the computer record data from the JSS API

cmd="curl --silent --user ${apiuser}:${apipass} --request GET ${apiurl}JSSResource/computers/udid/$udid"
hostinfo=$( ${cmd} )

# Now parse the data and get the usernames
# Start by removing all the XML before the VMWare Serial EA

serial=${hostinfo##*VMWare Serial\<\/name\><type>String</type><value>}

# Now remove everything after it. That should just leave us the serial number we require.
serial=${serial%%\<\/value\>*}

# Everything hopefully checks out. Run the serialiser.

/Applications/VMware\ Fusion.app/Contents/Library/Initialize\ VMware\ Fusion.tool set "" "" ${serial}

# Finished!

exit 0

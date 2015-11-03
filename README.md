# VMWare Fusion

This is a script and an extension attribute for JAMF's Casper Suite for VMWare Fusion.

The script will pull the current client's JSS record, find a serial number from a VMWare Fusion field and serialise any installed
version of VMWare Fusion. This is based on work by Marko Jung at Oxford University and frankly, I got the idea from a presentation he gave back in 2013. The bash variable stuff to simplify down the computer record returned by the JSS API is his work, merely modified by me to be Casper 9.x compliant.

The EA will simply return the current client's registered serial number to the JSS. If VMWare is not present, it will simply report
that a version of Fusion has not been installed.

See http://www.richard-purves.com/?p=130 

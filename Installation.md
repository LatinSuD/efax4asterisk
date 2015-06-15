# Installation of AGI script #

  1. Copy efax4asterisk.sh to /var/lib/asterisk/agi-bin or non-default agi-bin directory
  1. Change /path/to/directory/ to your specified fax directory in efax4asterisk.sh & Asterisk dial plan
  1. Verify paths to bash, echo, rm, tiff2pdf & mutt are correct in efax4asterisk.sh
  1. Write a dial plan - See [AsteriskDialPlan wiki](http://code.google.com/p/efax4asterisk/wiki/AsteriskDialPlan) for details
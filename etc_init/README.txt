The .conf scripts in this directory are upstart scripts for PRS' ARIS RCU software.
These scripts must be placed in the /etc/init directory.
They will automatically start PRS' ARIS software on boot-up and respawn a component if it fails.

These upstart scripts replace the /etc/rc.local commands used to start /opt/prs/rc.argo6.

Created by PR 2012-09-01


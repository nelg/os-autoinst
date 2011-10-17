use base "basetest";
use strict;
use bmwqemu;

sub run()
{
	sleep 3;
	waitidle;
	sendkey "ret"; # use default user
	waitidle;
	sendautotype "$password\n";
	waitstillimage(15,100); # time to load desktop
}

1;

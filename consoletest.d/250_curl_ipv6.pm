use base "basetest";
use bmwqemu;
# test for bug https://bugzilla.novell.com/show_bug.cgi?id=598574
sub is_applicable()
{
	return ($ENV{BIGTEST});
}

sub run()
{
	my $self=shift;
	script_run('curl www3.zq1.de/test.txt');
	sleep 2;
	$self->take_screenshot;
	script_run('rpm -q curl libcurl4');
	sleep 2;
}

sub checklist()
{
	# return hashref:
	return {qw(
		a0f2d8b443c6fe1153ca0c5b6692a719 OK
		26215f5bdec60d8c1b163768d41678d5 OK
		52a165a273962b59d2c72d3ad10a8bdb fail
		0bdf7328bb37fb32dd6b6975a5656c36 fail
		fb523ab71ee25f51bab242ba28e0c2f5 fail
	)}
}

1;

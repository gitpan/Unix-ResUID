#!perl -T

use strict;
use warnings;
use Test::More 0.88;
use Test::Exception;

use Unix::ResUID qw/getresuid setresuid/;

my ($ruid, $euid, $suid) = getresuid();

is($ruid, $<, 'ruid is $<');
is($euid, $>, 'ruid is $>');

diag("User id's are $ruid, $euid, $suid");

if ($ruid != $euid) {
	setresuid($euid, $ruid, -1);
	my ($nruid, $neuid, $nsuid) = getresuid();
	is($nruid, $euid, 'new ruid == old euid');
	is($neuid, $ruid, 'new euid == old ruid');
}
elsif ($euid == 0) {
	diag("Really running as root, whoohoo!");
	setresuid(1000, 1000, -1);
	my ($nruid, $neuid, $nsuid) = getresuid();
	is($nruid, 1000, 'new ruid == 1000');
	is($neuid, 1000, 'new euid == 100');
}

done_testing();

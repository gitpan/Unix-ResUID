package Unix::ResUID;
BEGIN {
  $Unix::ResUID::VERSION = '0.001';
}
use strict;
use warnings;

use XSLoader;

XSLoader::load(__PACKAGE__, __PACKAGE__->VERSION);

use Sub::Exporter -setup => {
	exports => [qw/getresuid setresuid getresgid setresgid/],
	groups  => {
		uid => [qw/getresuid setresuid/],
		gid => [qw/getresgid setresgid/],
	},
};

1;



=pod

=head1 NAME

Unix::ResUID - Reliable User ID management

=head1 VERSION

version 0.001

=head1 DESCRIPTION

This module provides a more reliable way to manage user IDs than $E<lt>/$E<gt> and C<POSIX::setuid()>. It may not work on all systems (though Linux and the BSDs should be supported), but unlike the previously mentioned solutions it will do the same on all of those. See L<Setuid Demystified|http://www.cs.berkeley.edu/~daw/papers/setuid-usenix02.pdf> for more information on the issues with setuid and friends.

=head1 FUNCTIONS

=head2 getresuid

Returns a list of the real UID, the effective UID, and the saved set-user-ID of the calling process.

=head2 setresuid

setresuid() sets the real user ID, the effective user ID, and the saved set-user-ID of the calling process.

Unprivileged  user  processes may change the real UID, effective UID, and saved set-user-ID, each to one of: the current real UID, the current effective UID or the current saved set-user-ID. Privileged processes may set the real UID, effective UID, and saved set-user-ID to arbitrary values. If one of the arguments equals -1, the corresponding value is not changed.

=head2 getresgid

Returns a list of the real GID, the effective GID, and the saved set-user-ID of the calling process.

=head2 setresgid

Completely analogously to setresuid, setresgid() sets the real GID, effective GID, and saved set-group-ID of the calling process, with the same restrictions for unprivileged processes. Note that privilegedness does not depend on any GID value.

=head1 ERRORS

These functions don't throw exceptions, but rather return undef/empty list and set $! to an appropriate value. Possible values include:

=over 4

=item * Operation not permitted (EPERM)

The calling process is not privileged and tried to change the IDs to values that are not permitted.

=item * Resource temporarily unavailable (EAGAIN)

The new real uid does not match the current real UID and this call would bring that user ID over its RLIMIT_NPROC resource limit.

=back

=head1 ACKNOWLEDGEMENTS

Large parts of this documentation are taken from linux' manpages on these functions.

=head1 AUTHOR

Leon Timmermans <leont@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Leon Timmermans.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

#ABSTRACT: Reliable User ID management


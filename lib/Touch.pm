package Touch;

use warnings;
use strict;

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Touch', $VERSION);

my %symbols = map {$_ => 1} qw /touch/;

sub import {
    my $class  = shift;
    my $caller = caller;
	 
    foreach my $name (@_ ? @_ : keys %symbols) {
        die "'$name' is not exported.\n" unless $symbols {$name};
	no strict 'refs';
	*{$caller . "::$name"} = \&{$class . "::$name"}
    }
}

1;

__END__

=head1 NAME

Touch - touch a file

=head1 VERSION

Version 0.01_01

=head1 SYNOPSIS

    use Touch;

    my $self = "somefile";
    touch($myself)  # file created or atime and mtime modified
       or die "touch() failed: $!";

=head1 FUNCTIONS

=over 4

=item touch EXPR

Updates the access  and modification times of the file indicated by
EXPR to the current time.

=back

=head1 TODO

There are a lot of additional options that surely would be nice to have.
They include:

=over 4

=item Ability to touch based on a FILEHANDLE or a DIRHANDLE on systems
with the C<futimes()> C library function.

=item Ability to set just access or modification times.

=item Ability to indicate the time and date to use.

=item Ability to set times based on another existing file, filehandle, 
or dirhandle.

=item Ability to set times to the nanosecond level on system that support
it.

=back

=head1 AUTHOR

Steve Peters, C<< <steve at fisharerojo.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-touch at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Touch>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Touch

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Touch>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Touch>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Touch>

=item * Search CPAN

L<http://search.cpan.org/dist/Touch>

=back

=head1 COPYRIGHT & LICENSE

Copyright 2006 Steve Peters, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Touch' );
}

diag( "Testing Touch $Touch::VERSION, Perl $], $^X" );

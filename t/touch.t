#!perl -T

use Test::More qw(no_plan);;

BEGIN {
    use_ok('Touch');
}

touch("testfile") or die "Unable to create test file: $!";

ok( -e "testfile", "Ensuring test file created");

my ($old_atime, $old_mtime)  = (stat "testfile")[8,9];

sleep 2;

touch("testfile") or die "Unable to create test file: $!";;

my ($new_atime, $new_mtime)  = (stat "testfile")[8,9];

ok($old_atime + 2 <= $new_atime) || diag "$old_atime $new_atime";
ok($old_mtime + 2 <= $new_mtime) || diag "$old_mtime $new_mtime";

END {
    unlink "testfile" if -e "testfile";
}

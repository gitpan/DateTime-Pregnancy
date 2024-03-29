# $Id$

use strict;
use Test::More tests => 6;

use_ok( "DateTime::Pregnancy", qw(calculate_month));

my $dt = DateTime->new(
	year  => 2004,
	month => 3,
	day   => 19,
);

my $month;
ok($month = calculate_month(
	first_day_of_last_period => $dt,
));

like($month, qr/\d+/);

my $dt2 = DateTime->new(
	year  => 2004,
	month => 12,
	day   => 24,
);

ok($month = calculate_month(
	first_day_of_last_period => $dt,
	date                           => $dt2,
));

is($month, 9);

is(calculate_month(), undef);

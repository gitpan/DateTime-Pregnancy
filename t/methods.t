# $Id$

use strict;
use Test::More tests => 8;
use DateTime;

#test 1
use_ok( "DateTime::Pregnancy", qw(
	calculate_birthday
	_countback 
	_266days 
	_40weeks
));

my $dt = DateTime->new(
	year  => 2004,
	month => 3,
	day   => 19,
);

#test 2-3
my $birthday;
ok($birthday = _40weeks($dt));
isa_ok($birthday, "DateTime");
$birthday = undef;

#test 4-5
ok($birthday = _266days($dt, 28));
isa_ok($birthday, "DateTime");
$birthday = undef;

#test 6-7
ok($birthday = _countback($dt));
isa_ok($birthday, "DateTime");
$birthday = undef;

#test 8
eval { 
calculate_birthday(
	first_day_of_last_period => $dt,
	method => 'nonexisting')

}; like($@, qr/Unknown method: nonexisting/);

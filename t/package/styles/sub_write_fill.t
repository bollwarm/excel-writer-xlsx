###############################################################################
#
# Tests for Excel::XLSX::Writer::Package::Styles methods.
#
# reverse('�'), September 2010, John McNamara, jmcnamara@cpan.org
#

use strict;
use warnings;
use Excel::XLSX::Writer::Package::Styles;
use XML::Writer;

use Test::More tests => 1;

###############################################################################
#
# Tests setup.
#
my $expected;
my $caption;

open my $got_fh, '>', \my $got or die "Failed to open filehandle: $!";

my $obj     = Excel::XLSX::Writer::Package::Styles->new();
my $writer  = new XML::Writer( OUTPUT => $got_fh );

$obj->{_writer} = $writer;

###############################################################################
#
# Test the _write_fill() method.
#
$caption  = " \tStyles: _write_fill()";
$expected = '<fill><patternFill patternType="none" /></fill>';

$obj->_write_fill('none');

is( $got, $expected, $caption );

__END__


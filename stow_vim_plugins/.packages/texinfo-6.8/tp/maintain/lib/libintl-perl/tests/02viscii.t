#! /usr/local/bin/perl -w

# vim: tabstop=4
# vim: syntax=perl

use strict;

use Test;

BEGIN {
	plan tests => 7;
}

use Locale::Recode;

sub int2utf8;

my $local2ucs = {};
my $ucs2local = {};

while (<DATA>) {
	my ($code, $ucs, undef) = map { oct $_ } split /\s+/, $_;
	$local2ucs->{$code} = $ucs;
	$ucs2local->{$ucs} = $code unless $ucs == 0xfffd;
}

my $cd_int = Locale::Recode->new (from => 'VISCII',
				  to => 'INTERNAL');
ok !$cd_int->getError;

my $cd_utf8 = Locale::Recode->new (from => 'VISCII',
				   to => 'UTF-8');
ok !$cd_utf8->getError;

my $cd_rev = Locale::Recode->new (from => 'INTERNAL',
				  to => 'VISCII');
ok !$cd_rev->getError;

# Convert into internal representation.
my $result_int = 1;
while (my ($code, $ucs) = each %$local2ucs) {
    my $outbuf = chr $code;
    my $result = $cd_int->recode ($outbuf);
    unless ($result && $outbuf->[0] == $ucs) {
	$result_int = 0;
	last;
    }
}
ok $result_int;

# Convert to UTF-8.
my $result_utf8 = 1;
while (my ($code, $ucs) = each %$local2ucs) {
    my $outbuf = chr $code;
    my $result = $cd_utf8->recode ($outbuf);
    unless ($result && $outbuf eq int2utf8 $ucs) {
        $result_utf8 = 0;
        last;
    }
}
ok $result_utf8;

# Convert from internal representation.
my $result_rev = 1;
while (my ($ucs, $code) = each %$ucs2local) {
    my $outbuf = [ $ucs ];
    my $result = $cd_rev->recode ($outbuf);
    unless ($result && $code == ord $outbuf) {
        $result_int = 0;
        last;
    }
}
ok $result_int;

# Check handling of unknown characters.
my $test_string1 = [ unpack 'c*', ' Supergirl ' ];
$test_string1->[0] = 0xad0be;
$test_string1->[-1] = 0xad0be;
my $test_string2 = [ unpack 'c*', 'Supergirl' ];

my $unknown = "\x3f"; # Unknown character!

$cd_rev = Locale::Recode->new (from => 'INTERNAL',
		               to => 'VISCII',
				)
&& $cd_rev->recode ($test_string1)
&& $cd_rev->recode ($test_string2)
&& ($test_string2 = $unknown . $test_string2 . $unknown);

ok $test_string1 eq $test_string2;

sub int2utf8
{
    my $ucs4 = shift;
    
    if ($ucs4 <= 0x7f) {
	return chr $ucs4;
    } elsif ($ucs4 <= 0x7ff) {
	return pack ("C2", 
		     (0xc0 | (($ucs4 >> 6) & 0x1f)),
		     (0x80 | ($ucs4 & 0x3f)));
    } elsif ($ucs4 <= 0xffff) {
	return pack ("C3", 
		     (0xe0 | (($ucs4 >> 12) & 0xf)),
		     (0x80 | (($ucs4 >> 6) & 0x3f)),
		     (0x80 | ($ucs4 & 0x3f)));
    } elsif ($ucs4 <= 0x1fffff) {
	return pack ("C4", 
		     (0xf0 | (($ucs4 >> 18) & 0x7)),
		     (0x80 | (($ucs4 >> 12) & 0x3f)),
		     (0x80 | (($ucs4 >> 6) & 0x3f)),
		     (0x80 | ($ucs4 & 0x3f)));
    } elsif ($ucs4 <= 0x3ffffff) {
	return pack ("C5", 
		     (0xf0 | (($ucs4 >> 24) & 0x3)),
		     (0x80 | (($ucs4 >> 18) & 0x3f)),
		     (0x80 | (($ucs4 >> 12) & 0x3f)),
		     (0x80 | (($ucs4 >> 6) & 0x3f)),
		     (0x80 | ($ucs4 & 0x3f)));
    } else {
	return pack ("C6", 
		     (0xf0 | (($ucs4 >> 30) & 0x3)),
		     (0x80 | (($ucs4 >> 24) & 0x1)),
		     (0x80 | (($ucs4 >> 18) & 0x3f)),
		     (0x80 | (($ucs4 >> 12) & 0x3f)),
		     (0x80 | (($ucs4 >> 6) & 0x3f)),
		     (0x80 | ($ucs4 & 0x3f)));
    }
}

#Local Variables:
#mode: perl
#perl-indent-level: 4
#perl-continued-statement-offset: 4
#perl-continued-brace-offset: 0
#perl-brace-offset: -4
#perl-brace-imaginary-offset: 0
#perl-label-offset: -4
#tab-width: 4
#End:


__DATA__
0x00	0x0000
0x01	0x0001
0x02	0x1eb2
0x03	0x0003
0x04	0x0004
0x05	0x1eb4
0x06	0x1eaa
0x07	0x0007
0x08	0x0008
0x09	0x0009
0x0a	0x000a
0x0b	0x000b
0x0c	0x000c
0x0d	0x000d
0x0e	0x000e
0x0f	0x000f
0x10	0x0010
0x11	0x0011
0x12	0x0012
0x13	0x0013
0x14	0x1ef6
0x15	0x0015
0x16	0x0016
0x17	0x0017
0x18	0x0018
0x19	0x1ef8
0x1a	0x001a
0x1b	0x001b
0x1c	0x001c
0x1d	0x001d
0x1e	0x1ef4
0x1f	0x001f
0x20	0x0020
0x21	0x0021
0x22	0x0022
0x23	0x0023
0x24	0x0024
0x25	0x0025
0x26	0x0026
0x27	0x0027
0x28	0x0028
0x29	0x0029
0x2a	0x002a
0x2b	0x002b
0x2c	0x002c
0x2d	0x002d
0x2e	0x002e
0x2f	0x002f
0x30	0x0030
0x31	0x0031
0x32	0x0032
0x33	0x0033
0x34	0x0034
0x35	0x0035
0x36	0x0036
0x37	0x0037
0x38	0x0038
0x39	0x0039
0x3a	0x003a
0x3b	0x003b
0x3c	0x003c
0x3d	0x003d
0x3e	0x003e
0x3f	0x003f
0x40	0x0040
0x41	0x0041
0x42	0x0042
0x43	0x0043
0x44	0x0044
0x45	0x0045
0x46	0x0046
0x47	0x0047
0x48	0x0048
0x49	0x0049
0x4a	0x004a
0x4b	0x004b
0x4c	0x004c
0x4d	0x004d
0x4e	0x004e
0x4f	0x004f
0x50	0x0050
0x51	0x0051
0x52	0x0052
0x53	0x0053
0x54	0x0054
0x55	0x0055
0x56	0x0056
0x57	0x0057
0x58	0x0058
0x59	0x0059
0x5a	0x005a
0x5b	0x005b
0x5c	0x005c
0x5d	0x005d
0x5e	0x005e
0x5f	0x005f
0x60	0x0060
0x61	0x0061
0x62	0x0062
0x63	0x0063
0x64	0x0064
0x65	0x0065
0x66	0x0066
0x67	0x0067
0x68	0x0068
0x69	0x0069
0x6a	0x006a
0x6b	0x006b
0x6c	0x006c
0x6d	0x006d
0x6e	0x006e
0x6f	0x006f
0x70	0x0070
0x71	0x0071
0x72	0x0072
0x73	0x0073
0x74	0x0074
0x75	0x0075
0x76	0x0076
0x77	0x0077
0x78	0x0078
0x79	0x0079
0x7a	0x007a
0x7b	0x007b
0x7c	0x007c
0x7d	0x007d
0x7e	0x007e
0x7f	0x007f
0x80	0x1ea0
0x81	0x1eae
0x82	0x1eb0
0x83	0x1eb6
0x84	0x1ea4
0x85	0x1ea6
0x86	0x1ea8
0x87	0x1eac
0x88	0x1ebc
0x89	0x1eb8
0x8a	0x1ebe
0x8b	0x1ec0
0x8c	0x1ec2
0x8d	0x1ec4
0x8e	0x1ec6
0x8f	0x1ed0
0x90	0x1ed2
0x91	0x1ed4
0x92	0x1ed6
0x93	0x1ed8
0x94	0x1ee2
0x95	0x1eda
0x96	0x1edc
0x97	0x1ede
0x98	0x1eca
0x99	0x1ece
0x9a	0x1ecc
0x9b	0x1ec8
0x9c	0x1ee6
0x9d	0x0168
0x9e	0x1ee4
0x9f	0x1ef2
0xa0	0x00d5
0xa1	0x1eaf
0xa2	0x1eb1
0xa3	0x1eb7
0xa4	0x1ea5
0xa5	0x1ea7
0xa6	0x1ea9
0xa7	0x1ead
0xa8	0x1ebd
0xa9	0x1eb9
0xaa	0x1ebf
0xab	0x1ec1
0xac	0x1ec3
0xad	0x1ec5
0xae	0x1ec7
0xaf	0x1ed1
0xb0	0x1ed3
0xb1	0x1ed5
0xb2	0x1ed7
0xb3	0x1ee0
0xb4	0x01a0
0xb5	0x1ed9
0xb6	0x1edd
0xb7	0x1edf
0xb8	0x1ecb
0xb9	0x1ef0
0xba	0x1ee8
0xbb	0x1eea
0xbc	0x1eec
0xbd	0x01a1
0xbe	0x1edb
0xbf	0x01af
0xc0	0x00c0
0xc1	0x00c1
0xc2	0x00c2
0xc3	0x00c3
0xc4	0x1ea2
0xc5	0x0102
0xc6	0x1eb3
0xc7	0x1eb5
0xc8	0x00c8
0xc9	0x00c9
0xca	0x00ca
0xcb	0x1eba
0xcc	0x00cc
0xcd	0x00cd
0xce	0x0128
0xcf	0x1ef3
0xd0	0x0110
0xd1	0x1ee9
0xd2	0x00d2
0xd3	0x00d3
0xd4	0x00d4
0xd5	0x1ea1
0xd6	0x1ef7
0xd7	0x1eeb
0xd8	0x1eed
0xd9	0x00d9
0xda	0x00da
0xdb	0x1ef9
0xdc	0x1ef5
0xdd	0x00dd
0xde	0x1ee1
0xdf	0x01b0
0xe0	0x00e0
0xe1	0x00e1
0xe2	0x00e2
0xe3	0x00e3
0xe4	0x1ea3
0xe5	0x0103
0xe6	0x1eef
0xe7	0x1eab
0xe8	0x00e8
0xe9	0x00e9
0xea	0x00ea
0xeb	0x1ebb
0xec	0x00ec
0xed	0x00ed
0xee	0x0129
0xef	0x1ec9
0xf0	0x0111
0xf1	0x1ef1
0xf2	0x00f2
0xf3	0x00f3
0xf4	0x00f4
0xf5	0x00f5
0xf6	0x1ecf
0xf7	0x1ecd
0xf8	0x1ee5
0xf9	0x00f9
0xfa	0x00fa
0xfb	0x0169
0xfc	0x1ee7
0xfd	0x00fd
0xfe	0x1ee3
0xff	0x1eee

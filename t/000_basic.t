#!/usr/bin/perl

use 5.006;

use strict;
use warnings;
no  warnings 'syntax';

use Test::More tests => 2;

BEGIN {
    use_ok ('Acme::CPANAuthors::EU');
}

ok defined $Acme::CPANAuthors::EU::VERSION, "VERSION is set";

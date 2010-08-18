package Acme::CPANAuthors::EU;

use 5.006;
use strict;
use warnings;
no  warnings 'syntax';

our $VERSION = '2010081801';

my @NATIONALITIES;

BEGIN {
    @NATIONALITIES = qw [Austrian British French German Italian Portuguese];
    foreach my $nat (@NATIONALITIES) {
        eval "require Acme::CPANAuthors::$nat" or die $@;
    }
}

use Acme::CPANAuthors::Register (
   (map {"Acme::CPANAuthors::$_" -> authors} @NATIONALITIES),
    ABIGAIL       =>   'Abigail',
);


1;

__END__

=head1 NAME

Acme::CPANAuthors::EU - EU CPAN authors

=head1 SYNOPSIS

 use Acme::CPANAuthors;

 my $authors  = Acme::CPANAuthors -> new ("EU");

 my $number   = $authors -> count;
 my @ids      = $authors -> id;
 my @distros  = $authors -> distributions ("ABIGAIL");
 my $url      = $authors -> avatar_url    ("ABIGAIL");
 my $kwalitee = $authors -> kwalitee      ("ABIGAIL");
 my $name     = $authors -> name          ("ABIGAIL");

See documentation for Acme::CPANAuthors for more details.

=head1 DESCRIPTION

This class provides a hash of EU authors' PAUSE ID and name to
the C<< Acme::CPANAuthors >> module.

=head1 MAINTENANCE

If you're EU CPAN author without further specified nationality,
please send me your ID/name via email, and I may keep this module op
to date.

=head1 TODO

Add more countries if they become available.

=head1 DEVELOPMENT

The current sources of this module are found on github,
L<< git://github.com/Abigail/Acme--CPANAuthors--EU.git >>.

=head1 AUTHOR

Abigail, L<< mailto:cpan@abigail.be >>.

=head1 COPYRIGHT and LICENSE

Copyright (C) 2009 by Abigail.

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),   
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHOR BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

=head1 INSTALLATION

To install this module, run, after unpacking the tar-ball, the 
following commands:

   perl Makefile.PL
   make
   make test
   make install

=cut

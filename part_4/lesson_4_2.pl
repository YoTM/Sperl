#!/usr/bin/env perl

use strict;
use warnings;
use 5.016;
use Data::Dumper;

# # На вход вам будет подаваться имя пакета.
# Ваша задача - вывести все возможные пути нахождения этого файла в порядке следования префиксов в @INC,
# по одному на строку. В качестве символа "конец строки" используйте \n.
#
# Sample Input:
#
# Local::Store
#
# Sample Output:
#
# /usr/local/lib/perl5/site_perl/Local/Store.pm
# /usr/local/share/perl5/site_perl/Local/Store.pm
# /usr/lib/perl5/vendor_perl/Local/Store.pm
# /usr/share/perl5/vendor_perl/Local/Store.pm
# /usr/lib/perl5/core_perl/Local/Store.pm
# /usr/share/perl5/core_perl/Local/Store.pm

sub pkg_to_filename {
    my ($pkg) = @_;
    $pkg =~ s!::!/!g;
    return "${pkg}.pm";
}


chomp(my $input = <STDIN>);
my $path = &pkg_to_filename($input);
foreach my $str (@INC) {
    print $str . "/$path\n";
}

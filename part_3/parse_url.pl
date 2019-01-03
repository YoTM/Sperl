#!/usr/bin/env perl

#https://ru.wikipedia.org/wiki/%D0%A8%D0%B5%D0%B1%D0%B0%D0%BD%D0%B3_(Unix)

use strict;
use warnings;
use 5.016;
use Data::Dumper;


sub parse_url {
    my ($url) = @_;
    $url =~ m!(?:(?<schema>[^:/?#]+):)?(?://(?<domain>[^/?#:]*))?:?(?<port>\d+)?(?<path>[^?#]*)(?:\?(?<query_string>[^#]*))?(?:#(?<anchor>.*))?!;
    return %+;
}

my %hash = parse_url("http://mail.ru:8080/r/p?s=10&z=11#text");
say Dumper \%hash;
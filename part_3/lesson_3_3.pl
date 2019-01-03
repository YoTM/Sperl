#!/usr/bin/env perl

#https://ru.wikipedia.org/wiki/%D0%A8%D0%B5%D0%B1%D0%B0%D0%BD%D0%B3_(Unix)

use strict;
use warnings;
use 5.016;
use Data::Dumper;


sub parse_url {
    my ($url) = @_;
    my %res_hash;

    # общий шаблон регулярки
	my $pattern = qr{^
        ((?<schema>http[s]?)://)? # schema
        (?<domain>[a-z0-9-]+(\.[a-z0-9-]+)+) # domain
		:?
        (?<port>([\d]+)*)? # port
        (?<path>[^?#]*)? # path
        \??
        (?<query_string>[^#?]*)? # query_string
        \#?
        (?<anchor>[^#]*)? # anchor
        $}x;
    # проверяем URL по шаблону и заполняем хэш результата
	if ($url =~ m{$pattern}) {
        print "$url \n";
		%res_hash = (
		"schema" => $+{schema},
		"domain" => $+{domain},
    	"port" => "$+{port}",
    	"path" => "$+{path}",
    	"query_string" => "$+{query_string}",
    	"anchor" => "$+{anchor}",
    	);
	}

    # чистим хэш от пустых значений
    while ( (my $key, my $value) = each %res_hash ) {
        if (length $value < 1) {
            delete $res_hash{$key};
        }
    }

    return %res_hash;
}

my %hash = parse_url("http://mail.ru/r/p?s=10");
say Dumper \%hash;
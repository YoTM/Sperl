#!/usr/bin/env perl

#https://ru.wikipedia.org/wiki/%D0%A8%D0%B5%D0%B1%D0%B0%D0%BD%D0%B3_(Unix)

use strict;
use warnings;
use 5.016;
use Data::Dumper;

# Напишите функцию, которая извлекает ключи и значения из query string ﻿(https://en.wikipedia.org/wiki/Query_string).
#
# ﻿my $hashref = ﻿parse_query_string("key1=value1&key2=value2")
#
# ﻿$hashref = ﻿{
#     key1 => "value1",
#     key2 => "value2"
# }
#
# Будьте готовы к тому, что ﻿данные могут выглядеть не так аккуратно, как в приведенном примере.

sub parse_query_string {
    my ($string) = @_;
    # разбаваем по &
    my @query_string = split /&+/,  $string;
    my @result;
    foreach (@query_string){
        my @buf = split /=+/;
        my $count = $#buf;
        if ( $count == 0) {
            # одно значение
            push ( @result, "key", @buf );

        } else{
            push ( @result, @buf );
        }
    }
    return @result;
}


my %hashref = parse_query_string("key1=value1&key2=value2");
say "Test-0";
say Dumper \%hashref;

%hashref = parse_query_string("key1=value0=value1&key2=value2");
say "Test-1";
say Dumper \%hashref;

%hashref = parse_query_string("key1=value1&&key2=value2");
say "Test-2";
say Dumper \%hashref;

%hashref = parse_query_string("e0a72cb2a2c7");
say "Test-3";
say Dumper \%hashref;
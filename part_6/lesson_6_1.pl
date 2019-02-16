#!/usr/bin/env perl

use utf8;
use 5.016;
use strict;
use warnings;

# Во входной поток STDIN подаются строки символов; некоторые из них повторяются более одного раза.
# Необходимо написать программу для определения количества повторов для каждой уникальной строки,
# длины этой строки и вывода этих данных в файл /tmp/uniq.txt
# (в формате "<кол-во повторов><пробел><длина строки><пробел><строка>\n").
# Файл удалять не надо.

sub main {

    my %input;

    while(<>) {
        chomp;
        $input{ $_ }++;
    }

    open(my $fh, '>>', '/tmp/uniq.txt') or die $!;
    while ( my ($key, $value) = each %input ) {
        my $str = $value . ' ' . length($key) . ' ' . $key . "\n";
        print $fh $str;
    }
    close $fh or die $!;
}

&main();
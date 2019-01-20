#!/usr/bin/env perl

use strict;
use warnings;
use 5.016;
use Data::Dumper;

# Напишите программу, которая экранирует  все символы из списка:
#
# { } [ ] ( ) ^ $ . | * + ? \

my $string = <STDIN>;

$string =~ s/
        \{ |
        \} |
        \[ |
        \] |
        \( |
        \) |
        \^ |
        \$ |
        \. |
        \| |
        \* |
        \+ |
        \? |
        \\
        /\\$&/xg;

print $string, "\n";
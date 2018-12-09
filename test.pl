#!/usr/bin/env perl

#https://ru.wikipedia.org/wiki/%D0%A8%D0%B5%D0%B1%D0%B0%D0%BD%D0%B3_(Unix)

use strict;
use warnings;
use 5.016; # ﻿для того чтобы можно было использовать полезные функции из новых версий. Например, say


my ($x, $y) = (-10, 40);
    metka: for (my $n = $x; $n <= $y; $n++) {
        print "\nПроверяю $n -- ";
        if ($n < 1) { next; }
        if ($n == 1) { next; }
        if ($n == 2 or $n == 3) { print "$n\n"; next; }

        # перебираем возможные делители от 2 до sqrt(n)
        for (my $d = 2; $d*$d <= $n; $d++) {
            # если разделилось нацело, то составное
            if ($n % $d == 0) {
                print "составное";
                next metka; }
        }

        print "простое - $n\n"
    }
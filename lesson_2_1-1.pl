#!/usr/bin/env perl

#https://ru.wikipedia.org/wiki/%D0%A8%D0%B5%D0%B1%D0%B0%D0%BD%D0%B3_(Unix)

use strict;
use warnings;
use 5.016; # ﻿для того чтобы можно было использовать полезные функции из новых версий. Например, say
sub min_and_max {
    my ($x, $y, $z) = @_;
    my $value1 = $x;
    my $value2 = $y;
    my $value3 = $z;

    if ( $x > $value3 ) { $value3 = $x }
    elsif ( $x > $value2 ) { $value2 = $x }

    if ( $y > $value3 ) { $value3 = $y }
    elsif ( $y > $value2 ) { $value2 = $y }
    elsif ( $y < $value1 ) { $value1 = $y }

    if ( $z > $value3 ) { $value3 = $z}
    elsif ( $z > $value2 ) { $value2 = $z }
    elsif ( $z < $value1 ) { $value1 = $z }

    print "$value1, $value3\n"


}

# ﻿считываем данные ﻿с STDIN, пока они не закончатся
while (my $line = <>){
    #
    print("$line")
}

# ﻿какие то манипуляции с входными данными
# ﻿сюда встраивается ваш код

# вывод на STDOUT
print "...";
say "...";
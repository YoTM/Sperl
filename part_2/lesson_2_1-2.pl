#!/usr/bin/env perl

#https://ru.wikipedia.org/wiki/%D0%A8%D0%B5%D0%B1%D0%B0%D0%BD%D0%B3_(Unix)

use strict;
use warnings;
use 5.016; # ﻿для того чтобы можно было использовать полезные функции из новых версий. Например, say

sub solve_equation {
    #     принимает на вход коэффиценты квадратного уравнения  $a_value, $b_value, $c_value.
    #     вычисляет корни в переменные $x1 и $x2($x1 < $x2).
    #     печатает результат вычисления в виде строки "$x1, $x2\n".
    #     если уравнение имеет единственное решение, то печатает результат в виде  "$x1\n".
    #
    # Если уравнение не имеет решения или не является квадратным, должно быть напечатано
    # "No solution!\n"

    my ($a_value, $b_value, $c_value) = @_;
    my $x1;
    my $x2;
    my $D;

    if ($a_value == 0) { return print "No solution!\n"; };

    $D = $b_value**2 - 4*$a_value*$c_value;

    if ($D < 0) { return print "No solution!\n"; }
    elsif ($D == 0) {
        $x1 = (-$b_value)/(2*$a_value);
        return print "$x1\n";
    }
    else {
        $x1 = (-$b_value-sqrt($D))/(2*$a_value);
        $x2 = (-$b_value+sqrt($D))/(2*$a_value);
        if ($x2<$x1) { ($x1, $x2) = ($x2, $x1); };

        return print "$x1, $x2\n";
    };

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
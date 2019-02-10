#!/usr/bin/env perl

use strict;
use warnings;
use 5.016;
use Data::Dumper;

# Реализуйте класс для товара в интернет-магазине Local::Product, и позволяющий вести расчет его цены и стоимости в валютах рубль (RUR) и доллар США (USD).  Для определенности курс доллара принимается равным 70 рублей.
#
# Класс должен иметь свойства (и соответствующие им аксессоры):
#
#     name (имя товара)
#     count (количество единиц)
#     price_rur (цена за штуку, в рублях)
#     price_usd (цена за штуку, в долларах США)
#     sum_rur (стоимость всех товаров, в рублях)
#     sum_usd (стоимость всех товаров, в долларах США)
#
# При создании объекта конструктору (new) должны обязательно должны быть переданы свойство name и только одно из свойств price_rur или price_usd. В случае отсутствия свойства count его значение принимается равным единице. Свойства sum_rur, sum_usd задать в конструкторе нельзя. Если конструктор вызван с неправильным набором данных, необходимо вместо объекта вернуть undef.
#
# Свойства sum_rur, sum_usd доступны только для чтения. Остальные свойства могут быть установлены через аксессоры.
#
# Пример работы с объектом:
#
# my $product = Local::Product->new(name => 'Фуфырка обыкновенная', price_rur => 350, count => 5);
# print $product->price_rur; # 350
# print $product->price_usd; # 5
#
# $product->price_usd(7);
# print $product->price_rur; # 490
# print $product->price_usd; # 7
#
# $product->count(10);
# print $product->sum_rur;   # 4900
# print $product->sum_usd;   # 70

package Local::Product;

sub new {
    my $class = shift;
    my %data = @_;
    my $self;

    if ( $data{'name'} and ($data{'price_rur'} xor $data{'price_usd'}) and (keys %data <= 3)) {
        $data{ 'count' } = 1 unless $data{ 'count' };
        # устанавливаем начальные значения цен
        if ( $data{'price_rur'} ) {
            $data{'price_usd'} = $data{'price_rur'} / 70;
            $data{ 'sum_rur' } = $data{'price_rur'} * $data{ 'count' };
            $data{ 'sum_usd' } = $data{'price_usd'} * $data{ 'count' };
        } else {
            $data{'price_rur'} = $data{'price_usd'} * 70;
            $data{ 'sum_rur' } = $data{'price_rur'} * $data{ 'count' };
            $data{ 'sum_usd' } = $data{'price_usd'} * $data{ 'count' };
        }
        $self = bless \%data, $class;
    } else {
        $self = undef;
    }
    return $self;
}

sub name {
    my $self = shift;
    $self->{'name'} = $_[0] if @_;
    return $self->{'name'};
}

sub count {
    my $self = shift;
    $self->{'count'} = $_[0] if @_;
    return $self->{'count'};
}

sub price_rur {
    my $self = shift;
    # если заносим новое значение в рублях - пересчитываем цену в баксах
    if ( @_ ) {
        $self->{'price_rur'} = $_[0];
        $self->{'price_usd'} = $_[0] / 70;
    }
    return $self->{'price_rur'};
}

sub price_usd {
    my $self = shift;
    # если заносим новое значение в баксах - пересчитываем цену в рублях
    if ( @_ ) {
        $self->{'price_usd'} = $_[0];
        $self->{'price_rur'} = $_[0] * 70;
    }
    return $self->{'price_usd'};
}

sub sum_rur {
    my $self = shift;
    return $self->{'price_rur'} * $self->{'count'};
}

sub sum_usd {
    my $self = shift;
    return $self->{'price_usd'} * $self->{'count'};
}


# Начало программы

my $product = Local::Product->new(name => 'Фуфырка обыкновенная', price_rur => 350, count => 5);
print $product->price_rur, "\n"; # 350
print $product->price_usd, "\n"; # 5

$product->price_usd(7);
print $product->price_rur, "\n"; # 490
print $product->price_usd, "\n"; # 7

$product->count(10);
print $product->sum_rur, "\n";   # 4900
print $product->sum_usd, "\n";   # 70

#!/bin/perl -w

use strict;
use feature 'say';

sub three_Sum{
	my @nums = sort {$a <=> $b} @_;
	my @result;

	foreach (0 .. $#nums - 1){
		next if $nums[$_] == $nums[$_ - 1]; 
		my $target = 0 - $nums[$_];
		my $l = $_ + 1;
		my $r = $#nums;

		while ($l < $r){
			if ($nums[$l] + $nums[$r] == $target){
				push(@result, [$nums[$_], $nums[$l], $nums[$r]]);
				$r -= 1;
				$l += 1;
				$r -= 1 while $nums[$r] == $nums[$r + 1] and $l < $r;
				$l += 1 while $nums[$l] == $nums[$l - 1] and $l < $r;
			}
			$r -= 1 if $nums[$l] + $nums[$r] > $target;
			$l += 1 if $nums[$l] + $nums[$r] < $target;
		}
	}

	return @result
}

my @result1 = three_Sum(-1, 0, 1, 2, -1, -4);
my @result2 = three_Sum(-2, 0, 0, 3, 9, -7);

say '(' . join(', ', @$_) . ')' foreach @result1; # (-1, -1, 2) (-1, 0, 1)
say '(' . join(', ', @$_) . ')' foreach @result2; # (-7, -2, 9)






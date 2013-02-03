#!/usr/bin/perl

while (my $line = <STDIN>) {
    chomp($line);

    ### MAP CODE (REPLACE) ###

    my @words = split(" ", $line);
    foreach my $word (@words) {

        print uc($word) . "\t1\n";
    }

    ### END MAP CODE (REPLACE) ###
}

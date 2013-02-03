#!/usr/bin/perl

sub reduce {
    my ($key, @values) = @_;

    ### REDUCE CODE (REPLACE) ###

    my $output = 0;
    for my $value (@values) {
        $output += $value;
    }

    print "$key $output\n";

    ### END REDUCE CODE (REPLACE) ###
}

my $key;
my @values;

while (my $line = <STDIN>) {
    chomp($line);
    my ($currKey, $currValue) = split(/\t/, $line, 2);

    if (!defined($key)) {
        $key = $currKey;
        $values = ();
    }

    if ($key eq $currKey) {
        push(@values, $currValue);
    } else {
        reduce($key,@values);
        $key = $currKey;
        @values = ($currValue);
    }
}

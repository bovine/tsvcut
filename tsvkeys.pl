#!/usr/local/bin/perl

# Prints out just the column names found on each line of the input.

use strict;

while (<STDIN>) {
    chomp;
    my %tsv = split("\t", $_);
    print join("\t", keys @tsv) . "\n";
}


    

#!/usr/local/bin/perl

use strict;

while (<STDIN>) {
    chomp;
    my %tsv = split("\t", $_);
    print join("\t", @tsv{@ARGV}) . "\n";
}

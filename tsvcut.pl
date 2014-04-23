#!/usr/local/bin/perl

use strict;

if ($ARGV[0] eq "-t") {
    # output column identifiers
    shift(@ARGV);
    while (<STDIN>) {
	chomp;
	my %tsv = split("\t", $_);
	my @result = map { ($_, $tsv{$_}) if exists($tsv{$_}) } @ARGV;
	print join("\t", @result) . "\n";
    }

} else {
    # no column identifiers
    while (<STDIN>) {
	chomp;
	my %tsv = split("\t", $_);
	print join("\t", @tsv{@ARGV}) . "\n";
    }
}

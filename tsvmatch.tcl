#!/usr/local/bin/tclsh

# Find lines in a TSV file that match the specified column patterns.

if {[llength $argv] < 2 || [llength $argv] % 2 != 0} {
	puts "Syntax: tsvmatch {column pattern} \[column pattern\] \[...\]"
	exit 1
}

while {[gets stdin line] >= 0} {
	array unset tsv
	array set tsv [split $line "\t"]

	set match 1
	foreach {key pattern} $argv {
		
		if {![info exists tsv($key)]} {
			set match 0
			break
		}

		if {![string match $pattern $tsv($key)]} {
			set match 0
			break
		}
	}

	if {$match} {
		puts $line
	}
}

exit 0

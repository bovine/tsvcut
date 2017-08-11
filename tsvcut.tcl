#!/usr/local/bin/tclsh

if {[lindex $::argv 0] eq "-t"} {
	# output column identifiers
	set ::argv [lrange $::argv 1 end]
	while {[gets stdin line] >= 0} {
		array unset tsv
		array set tsv [split $line "\t"]
		set result {}
		foreach term $::argv {
			if {[info exists tsv($term)]} {
				lappend result $term $tsv($term)
			}
		}
		puts [join $result "\t"]
	}
} else {
	# no column identifiers
	while {[gets stdin line] >= 0} {
		array unset tsv
		array set tsv [split $line "\t"]
		set result {}
		foreach term $::argv {
			if {[info exists tsv($term)]} {
				lappend result $tsv($term)
			} else {
				lappend result ""
			}
		}
		puts [join $result "\t"]
	}
}

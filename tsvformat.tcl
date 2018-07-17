#!/usr/local/bin/tclsh

# Prints out a tsv file in a pretty fixed-width table.

set rows {}
set cols {}

# read the entire input and compute maximum column widths.
while {[gets stdin line] >= 0} {
	foreach {key value} [split $line "\t"] {
		
		if {![info exists width($key)]} {
			set width($key) [string length $key]
			lappend cols $key
		}

		set lenval [string length $value]
		if {$width($key) < $lenval} {
			set width($key) $lenval
		}
	}

	lappend rows $line
}
if {$rows == ""} {
	exit 0
}

puts "cols = $cols"

# print the dotted separator line.
set separator "+"
foreach key $cols {
	set size $width($key)
	append separator [string repeat "-" [expr {$size + 2}]]
	append separator "+"
}
puts $separator

# print the header row.
set result {}
foreach key $cols {
	set size $width($key)
	lappend result [format "%-*s" $size $key]
}
puts "| [join $result { | }] |"

# print the dotted separator line.
puts $separator

# print the data with proper column widths.
foreach line $rows {
	array unset tsv
	array set tsv [split $line "\t"]

	set result {}
	foreach key $cols {
		set size $width($key)
		if {[info exists tsv($key)]} {
			lappend result [format "%-*s" $size $tsv($key)]
		} else {
			lappend result [string repeat " " $size]
		}
	}
	puts "| [join $result { | }] |"
}

# print the dotted separator line.
puts $separator

# print the row count.
puts "[llength $rows] rows."
exit 0

#!/usr/local/bin/tclsh

# Convert a JSON file to CSV.

package require yajltcl

if {[llength $argv] == 0} {
	puts "Must specify ordered list of column names for output CSV file."
	exit 1
}
set columns $argv


puts [join $columns ","]
while {[gets stdin line] >= 0} {
	array unset json
	array set json [::yajl::json2dict $line]

	set result {}
	foreach col $columns {
		if {![info exists json($col)]} {
			lappend result ""
		} else {
			lappend result $json($col)
			# TODO: need to handle escaping unsafe characters (comma, backslash)
		}
	}
	puts [join $result ","]
}

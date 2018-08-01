#!/usr/local/bin/tclsh

# Convert a JSON file to TSV.

package require yajltcl


while {[gets stdin line] >= 0} {
	set jsonkv [::yajl::json2dict $line]
	puts [join $jsonkv "\t"]
}

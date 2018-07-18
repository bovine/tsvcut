#!/usr/local/bin/tclsh

# Convert a TSV file into JSON.

package require yajltcl

set json [yajl create #auto]

while {[gets stdin line] >= 0} {

	$json map_open
	foreach {key value} [split $line "\t"] {
		$json string $key string $value
	}
	$json map_close

	puts [$json get]
	$json reset
}

$json delete

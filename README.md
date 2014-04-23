tsvcut
======

This is a simple command-line program to cut out specific fields from
a TSV (tab separated values) file and return just those values.  Its
behavior is inspired by the UNIX cut(1) command, but is specifically
tailored for the TSV file format.

All TSV input files are expected to be lines separated by alternating
key-value pairs that are separated by tab characters.  The ordering of
fields can be vary between lines, as long as consistent field names
are used.  Some lines may include fields that are not present on other
lines.  For example:

````
color	blue	fruit	blueberry	price	1.99
color	red	fruit	strawberry	price	3.99	sale	2.99
color	yellow	price	2.49	fruit	banana
````

The tsvcut command should be run with the list of desired fields on
its command-line, and the TSV file supplied as stdin (using
redirection or pipes):

    tsvcut color price < fruits.tsv

    blue	1.99
    red	3.99
    yellow	2.49


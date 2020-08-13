#!/usr/bin/python

# Usage: ./reverse.py <path>
# Example: ./reverse.py //etc/passwd

import sys

str = sys.argv[1]

length = len(str)

revstr = str[::-1]

print 'String lenght:%d'  %(length)

while length > 0:
	
	print revstr[:4] , ':' , revstr[:4].encode('hex')
	revstr = revstr[4:length]
	length = len(revstr)

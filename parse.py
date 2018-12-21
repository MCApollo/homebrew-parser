#!/usr/bin/env python3

import sys

sys.path.insert(0, '../homebrewparser')

from homebrewparser import *

if len(sys.argv) < 2:
	print("Usage:\n\thomebrew-parser <file>\n")
	sys.exit(1)

Parsed = HomebrewParser()
output = Parsed.Parse(sys.argv[1])

for key, value in list(output.items()):
	print(key, ':')
	for item in value:
		print("--> ", item)

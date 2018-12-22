#!/usr/bin/env python3

"""
	MC - HomeBrew-Parser

	TODO:
		-> Advance looping (ends early if we hit a false pos)
		-> Support for `resource FooBar do`
"""

import sys
import re

class HomebrewParser(object):
	def __init__(self):
		self.formula = {
			'name': [],
			'homepage': [],
			'url': [],
			'description': [],
			'build_deps': [],
			'link_deps': [],
			'conflicts': [],
			'patches': [],
			'EOF_patch': [],
			'install': []
		}
	@staticmethod
	def preprocess(line):
		""" Removes the commens and excess spaces. """

		if "# " in line:
			line = line[:line.index('#')]
		line = line.strip()
		return line

	def parse_line(self, line):
		""" Handles conflict & dependency """
		if line.startswith('depends_on'):
			match = line.split()[1].strip('\"')
			if line.endswith(':build'):
				self.formula['build_deps'].append(match)
			else:
				self.formula['link_deps'].append(match)
		elif line.startswith('conflicts_with'):
		# https://github.com/Homebrew/homebrew-core/blob/eea44928f3476bca9c0ab6f91bc6f82372eb2a7a/Formula/mariadb-connector-c.rb
		# Deals with edge case:
			match = re.compile(r'\"(\S*)\"').findall(line)
			for conflict in match:
				self.formula['conflicts'].append(conflict)

	def parse_formula(self, path=''):
		""" Parses a formula and returns a dict """
		if path == '':
			print('File is not set!?')
			sys.exit(1)
		contents = open(path).readlines()
		# Affects how to parse data
		Debug		= False # XXX: Remove Debug
		foundURL	= False # Ensure DL URL is found in the very least
		shouldLoop 	= False # "Fast-Forward" mode
		patchMode	= False # Keep URLs of patches
		isData		= False # Expect patch file at EOF
		installMode	= False # Keep install instructions
		endCount	= 0	# Part of installMode
		# We `shouldLoop` if this is met.
		LoopRegex = re.compile(
			r'^(?:bottle|head|test)')
		''''''
		for line in contents:
			line = self.preprocess(line)
			match = None
			if Debug:
				print('--> ', line)
			if line == '':
				continue
			elif line.startswith('end'):
				if installMode and endCount > 0:
					if Debug:
						print('endCount --> ', endCount)
					# Dirty-ish way to keep track if this is the right 'end' to stop on.
					# Append line because the cont will stop the parsing here.
					endCount -= 1
					self.formula['install'].append(line)
					continue
			# Reset vars
				shouldLoop	= False
				patchMode	= False
				installMode	= False
				endCount	= 0
				continue
			# Patch & Install modes used here:
			elif shouldLoop and not line.startswith('end'):
				if patchMode and line.startswith('url'):
					try:
						match = re.compile(r'(?:.*\")(.*)(?:\")').match(line).groups()
					except AttributeError:
						pass
					if match:
						if Debug:
							print('patch --> got url ', ''.join(match))
						match = ''.join(match)
						self.formula['patches'].append(match)
				if installMode:
					if Debug:
						print('install ', line)
					if ' do' in line:
						if Debug:
							print('install --> do')
						endCount += 1
					self.formula['install'].append(line)
				continue

			if LoopRegex.search(line): # (bottle|head|test)
				# Edge cases:
				if line.endswith(':unneeded'):
					continue #--> bottle :unneeded
				else:
					if Debug:
						print('LoogRegex --> Fowarding')
					shouldLoop = True
					continue # XXX: Add more keywords to this regex
			elif line.startswith('class'): # Grabs Name
				try:
					match = re.compile(r'(?:class )([A-Za-z0-9]*)').match(line).groups()
				except AttributeError:
					pass
				if match:
					match = ''.join(match)
					self.formula['name'].append(match)
			elif line.startswith('desc'): # Grabs description
				try:
					match = re.compile(r'(?:.*\")(.*)(?:\")').match(line).groups()
				except AttributeError:
					pass
				if match:
					match = ''.join(match)
					self.formula['description'].append(match)
			elif line.startswith('homepage'): # Homepage
				try:
					match = re.compile(r'(?:.*\")(.*)(?:\")').match(line).groups()
				except AttributeError:
					pass
				if match:
					match = ''.join(match)
					self.formula['homepage'].append(match)
			elif line.startswith('url') and not foundURL: # Other values can be wrong, but this should not.
				try:
					match = re.compile(r'(?:.*\")(.*)(?:\")').match(line).groups()
				except AttributeError:
					pass
				if match:
					match = ''.join(match)
					self.formula['url'].append(match)
					foundURL = True
			elif line.startswith('depends_on'): # Let the function sort this.
				self.parse_line(line)
			elif line.startswith('conflicts_with'):
				self.parse_line(line)
			elif line.startswith('def'): # XXX: Do something more for other keywords.
				if line.endswith('install'):
					if Debug:
						print('def --> install')
					shouldLoop = True
					installMode = True
			elif line.startswith('patch'): # Log Patches
			# ex. -> patch :p1 --> `patch -p1 < file`
				if line.endswith('do'):
					if Debug:
						print('patch --> do')
					shouldLoop = True
					patchMode = True
				if line.endswith(':DATA') and Debug:
					print('patch --> data at EOF')
			elif line.endswith('__END__') or isData:
				isData = True
				if line.endswith('__END__'):
					continue # Skip adding '__END__' to outdata.
				if Debug:
					print('EOF --> ', line)
				self.formula['EOF_patch'].append(line)
		return self.formula

	def Parse(self, formula):
		""" Wrapper for parse_formila() """
		return self.parse_formula(formula)


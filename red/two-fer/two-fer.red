Red [
	description: {"Two-fer" exercise solution for exercism platform}
	author: "" ; you can write your name here, in quotes
]

two-fer: function [
	name [string! none!]
] [
	rejoin [
		"One for "
		either name [name] ["you"]
		", one for me."
	]
]

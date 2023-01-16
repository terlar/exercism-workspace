Red [
	description: {"Two-fer" exercise solution for exercism platform}
	author: "Terje Larsen"
]

two-fer: function [
	name [string! none!]
] [
	rejoin [
		"One for "
		any [name "you"]
		", one for me."
	]
]

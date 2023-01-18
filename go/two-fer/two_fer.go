// Package twofer provides a method to produce messages with intent of sharing.
package twofer

import "fmt"

// ShareWith returns a message with intent to share something with someone else.
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}

//  Twofer is short for two for one. One for you and one for me.
package twofer

import "fmt"

// ShareWith returns an intent to share something with someone else.
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}

package main

import "fmt"
import "strings"

// TODO: Revisit this, because they aren't actually arrays
func arrays() {
	// vowels := []string{"a","e","i","o","u"}
	vowels := "aeiou"

	words := [7]string{"hello", "world", "nvwls", "alex", "Jean", "grp", "sr"}

	for i := 0; i < len(words); i++ {
		cur_word := words[i]
		if strings.ContainsAny(cur_word, vowels) {
			fmt.Printf("%-12s contains a vowel!\n", cur_word)
		} else {
			fmt.Printf("%-12s does not contain a vowel!\n", cur_word)
		}
	}
}

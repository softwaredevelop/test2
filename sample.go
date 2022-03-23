package main

func main() {}

// there are no such linter "deaccode", it's a typo, but `nolintlint` linter will show warning (perfectly fine).
// and this is braks vsc-go

//nolint:deacdcode
func addd(a, b int) int {
	a += 10
	b += 11
	return a + b
}

func nouse() {}

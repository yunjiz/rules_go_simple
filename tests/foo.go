package foo

import (
	"fmt"
	"rules_go_simple/tests/bar"
	"rules_go_simple/tests/baz"
)

func Foo() {
	fmt.Println("foo")
	bar.Bar()
	baz.Baz()
}

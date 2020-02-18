package bar

import (
	"fmt"
	"rules_go_simple/tests/baz"
)

func Bar(){
	fmt.Println("bar")
	baz.Baz()
}

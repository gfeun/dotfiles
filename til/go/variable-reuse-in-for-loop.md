# Is it safe to use local loop variables adresses ?

No !

Variables in for loop are reused, so if you happen to use the variable address (&i) you're in for a debugging ride.

Example buggy code where i loop over an int array and send the local loop variable address inside a channel:
```go
package main

import (
	"fmt"
	"sync"
)

func main() {
	chan1 := make(chan *int)

	var wg sync.WaitGroup
	wg.Add(1)
	go func() {
		for i := range chan1 {
			fmt.Printf("%#x %d\n", i, *i)
		}
		wg.Done()
	}()

	for _, i := range []int{1, 2, 3, 4} {
		chan1 <- &i
	}

	close(chan1)
	wg.Wait()
}
```

`go run main.go` output:

```
0xc0000140d8 1
0xc0000140d8 2
0xc0000140d8 4
0xc0000140d8 4
```

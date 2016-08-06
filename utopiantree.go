//Solution to https://www.hackerrank.com/challenges/utopian-tree

package main

import "fmt"

func main() {
	//Enter your code here. Read input from STDIN. Print output to STDOUT
	var t, n int
	fmt.Scanf("%d", &t)
	for i := 0; i < t; i++ {
		fmt.Scanf("%d", &n)
		h := calcHeight(n)
		fmt.Println(h)
	}
}

func calcHeight(s int) int {
	if s == 0 {
		return 1
	} else if s%2 == 0 {
		return calcHeight(s-1) + 1
	} else {
		return 2 * calcHeight(s-1)
	}
}

//solution for https://www.hackerrank.com/challenges/manasa-and-stones

package main

import "fmt"
import "sort"

func main() {
	//Enter your code here. Read input from STDIN. Print output to STDOUT
	var t, n, a, b int
	fmt.Scanf("%d\n", &t)
	for i := 0; i < t; i++ {
		fmt.Scanf("%d\n%d\n%d\n", &n, &a, &b)
		var out []int
		if a == b {
			res := (n - 1) * a
			out = append(out, res)
		} else {
			for j := 0; j < n; j++ {
				res := j*a + b*(n-1-j)
				out = append(out, res)
			}
		}
		sort.Ints(out)
		for _, v := range out {
			fmt.Printf("%d ", v)
		}
		fmt.Println()
	}
}

// Solution to https://www.hackerrank.com/challenges/angry-professor

package main

import "fmt"

func main() {
	var t int
	var n, k int
	var late, early, temp int
	fmt.Scanf("%d", &t)
	for i := 0; i < t; i++ {
		fmt.Scanf("%d %d", &n, &k)
		late, early, temp = 0, 0, 0
		for j := 0; j < n; j++ {
			fmt.Scanf("%d", &temp)
			if temp == 0 || temp < 0 {
				early++
			} else {
				late++
			}
		}
		if early >= k {
			fmt.Println("NO")
		} else {
			fmt.Println("YES")
		}
	}
}

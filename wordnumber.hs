-- convert a Numbers into words
-- ex : 1234 into "one-two-three-four"

module WordNumber where

import Data.List (intersperse)

-- convert a number into words
-- ex : 1234 -> "one-two-three-four"
digitToWord :: Int -> String
digitToWord n = concat $ intersperse "-" $ map wordNumber $ digits n

-- convert a number into list of individual digits
-- ex : 1234 -> [1,2,3,4]
digits :: Int -> [Int]
digits n = go n []
        where go 0 arr = arr
              go num arr = go quo arr1
                      where quo = num `div` 10
                            re = num `mod` 10
                            arr1 = re : arr

-- convert a digit to its word form
-- ex : 2 -> "two"
-- 7 -> "seven"
wordNumber :: Int -> String
wordNumber 0 = "zero"
wordNumber 1 = "one"
wordNumber 2 = "two"
wordNumber 3 = "three"
wordNumber 4 = "four"
wordNumber 5 = "five"
wordNumber 6 = "six"
wordNumber 7 = "seven"
wordNumber 8 = "eight"
wordNumber 9 = "nine"

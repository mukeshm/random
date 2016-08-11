-- convert a Numbers into words
-- ex : 1234 into "one-two-three-four"

module WordNumber where

import Data.List (intersperse)

-- convert a number into words
-- ex : 1234 -> "one-two-three-four"
wordNumber :: Int -> String
wordNumber n = concat $ intersperse "-" $ map digitToWord $ digits n

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
digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord 9 = "nine"

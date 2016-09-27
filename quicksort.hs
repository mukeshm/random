-- Implementation of quicksort

-- Since the parameters are constrained by typeclass Ord, We can use any types
-- which are instances of Ord, like Int, Double and Char
quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort ls ++ [x] ++ quickSort rs
                    where
                      ls = [l | l <- xs, l <= x] -- elements <= x
                      rs = [r | r <- xs , r > x] -- elements > x

-- λ> quickSort [9,1,8,2,7,3,6,4,5]
-- o/p : [1,2,3,4,5,6,7,8,9]

-- λ> quickSort "helloworld"
-- o/p : "dehllloorw"

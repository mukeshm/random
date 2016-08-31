-- finding prime factors of a given number

primeFactors :: Int -> [Int]
primeFactors n = factorize n 2 []
    where factorize n p xs
            | n == 1 = xs
            | otherwise = if mod n p == 0
                          then factorize (div n p) p (p:xs)
                          else factorize n (p+1) xs

-- i/p : primeFactors 7893
-- o/p : [877,3,3]
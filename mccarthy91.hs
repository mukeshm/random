-- https://en.wikipedia.org/wiki/McCarthy_91_function

mc91 :: Int -> Int
mc91 n
    | n > 100 = n - 10
    | otherwise = mc91 $ mc91 $ n + 11

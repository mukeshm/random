-- https://projecteuler.net/problem=42

module Main where

import Data.Char

charToNum :: Char -> Int
charToNum c = case isUpper c of 
                True -> (ord c) - 64
                otherwise -> (ord c) - 96

triangleNum :: [Int]
triangleNum = [div (n*(n+1)) 2 | n <-[1..]]

calcTnum :: String -> Int
calcTnum xs = go xs 0
                where go :: [Char] -> Int -> Int
                      go [] n = n
                      go (x:xs) n = go xs (n + charToNum x)

isTriangleNum :: String -> [Int] -> Bool
isTriangleNum xs (t:ts) = let tnum = calcTnum xs
                          in
                            if tnum == t 
                            then True
                            else 
                                if t > tnum
                                then False
                                else isTriangleNum xs ts 

fun :: String -> Int -> Int
fun s n = if isTriangleNum s triangleNum
            then (1 + n)
            else n

main :: IO ()
main = do
        file <- readFile "p042_words.txt"
        let ls = lines file
        let x = foldr (\s n -> if isTriangleNum s triangleNum then 1 + n else n) 0 ls
        putStrLn $ show x
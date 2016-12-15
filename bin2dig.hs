-- convert binary string to decimal 
module Main where
import System.Environment

bin2dig :: Int -> String -> Int
bin2dig digint "" = digint
bin2dig digint (x:xs) = let old = 2 * digint + (if x == '0' then 0 else 1)
                        in bin2dig old xs

main :: IO()
main = do
        args <- getArgs
        let binstr = args !! 0
        putStrLn $ "Decimal : " ++ (show $ bin2dig 0 binstr)
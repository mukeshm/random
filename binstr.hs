-- http://www.practice.geeksforgeeks.org/problem-page.php?pid=884

replaceFirstQ :: String -> Char -> String
replaceFirstQ [] ch = []
replaceFirstQ (x:xs) ch = if x == '?'
                        then ch : xs
                        else x:(replaceFirstQ xs ch)


xtreme :: String -> [String]
xtreme s
    | elem '?' s = (xtreme $ replaceFirstQ s '0') ++  (xtreme $ replaceFirstQ s '1')
    | otherwise = [s]

-- i/p : xtreme "1??0?101"
-- o/p : ["10000101","10001101","10100101","10101101","11000101","11001101","11100101","11101101"]
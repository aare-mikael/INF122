-- Oppgave 1
isPrefix1 :: String -> String -> Bool 
isPrefix1 [] ys = True 
isPrefix1 xs [] = False 
isPrefix1 (x:xs) (y:ys)
        | x == y        = isPrefix1 xs ys
        | otherwise     = False

isPrefix2 :: String -> String -> Bool 
isPrefix2 xs ys = take (length xs) ys == xs

isPrefix1 xs ys | x == y - isPrefix1 (tail xs) (tail ys)



-- Oppgave 2
locate :: String -> String -> [(Int, Int)]
locate [] ys = []
locate xs [] = []





-- Oppgave 3
translate :: String -> String
translate xs =



-- Oppgave 4
replace :: [(Int, Int)] -> String -> String 
replace = undefined
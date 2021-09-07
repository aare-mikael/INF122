--Oppgåve C

dobb :: [Int] -> [Int]
dobb [] = []
dobb [n] = [n*2]
dobb (x:xs) = x*2 : dobb xs

--Oppgåve D
fire :: [Int] -> [Int]
fire [] = []
fire [n] = [n*4]
fire (x:xs) = x*4 : dobb xs

--Oppgåve E
flett :: [Int] -> [Int] -> [Int]
flett [] xs = xs
flett (x:xs) ys = x : flett xs ys

--Oppgåve F
ele :: Int -> [a] -> a
ele n (x:xs) = if n == 1 then x else ele (n-1) xs


--Obligatorisk del

--Oppgåve G
addobb :: [Int] -> [Int]
addobb [] = []
addobb xs = xs ++ dobb xs

--Oppgåve H
-- Må ha med Eq a for å sammenligen generiske typer
pali :: Eq a => [a] -> Bool 
pali xs = xs == reverse xs 
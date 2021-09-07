-- Oblig 1
-- Mikael Aare

dobb :: [Int] -> [Int]
dobb [] = []

-- Oppgave G 
addobb :: [Int] -> [Int]
addobb [] = []
addobb xs = xs ++ dobb xs

-- Oppgave H
-- Må ha med Eq a for å sammenligne generiske typer
pali :: Eq a => [a] -> Bool 
pali xs = xs == reverse xs 
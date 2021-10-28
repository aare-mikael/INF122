-- Oppgave C: 
-- Programmer funksjon

-- dobb :: [Int] -> [Int] -- som fordobler hvert element i listen 
-- Input: en liste k med heltall
-- Output: listen der hvert element e fra listen k er erstattet med e+e (elementene står i den samme rekkefølgen som i k).
-- F.eks.:
-- dobb [] = []
-- dobb [1,2,3,8] = [2,4,6,16]
-- dobb [1,-12,3] = [2,-24,6]

--TODO C
dobb :: [Int] -> [Int]
dobb [] = []
dobb [k] = [k*2]
dobb (x:xs) = x*2 : dobb xs




-- Oppgave D: 
-- Programmer funksjonen 
-- fire :: [Int] -> [Int] -- som firedobler hvert element i listen, dvs.:
-- Input: en liste k med heltall
-- Output: listen der hvert element e fra listen k er erstattet med 4*e (elementene står i den samme rekkefølgen som i k).
-- F.eks.:
-- fire [] = []
-- fire [1,2,3,8] = [4,8,12,32]
-- fire [1,-12,3] = [4,-48,12]

-- Programmer denne funksjonen på minst to forskjellige måter.

-- TODO D
fire1 :: [Int] -> [Int]
fire1 [] = []
fire1 [k] = [k*4]
fire1 (x:xs) = x*4 : fire1 xs

fire2 :: [Int] -> [Int]
fire2 [] = []
fire2 [k] = dobb [k*2]
fire2 (x:xs) = 2 * (x*2) : fire2 xs




-- Oppgave E:
-- Programmer funksjon
-- flett :: [Int] -> [Int] -> [Int]
-- som fletter to sorterte lister av tall i en sortert liste, f.eks.:
-- flett [1,3,5] [2,4,6,7,8] = [1,2,3,4,5,6,7,8]

--TODO E
flett :: [Int] -> [Int] -> [Int]
flett [] [] = []
flett xs [] = xs
flett [] ys = ys
flett (x:xs) (y:ys) = 
    if x <= y
    then x : flett xs ys
    else y : flett xs ys
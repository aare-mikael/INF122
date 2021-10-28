-- Oppgave C: 
-- Programmer funksjon

-- dobb :: [Int] -> [Int] -- som fordobler hvert element i listen 
-- Input: en liste k med heltall
-- Output: listen der hvert element e fra listen k er erstattet med e+e (elementene står i den samme rekkefølgen som i k).
-- F.eks.:
-- dobb [] = []
-- dobb [1,2,3,8] = [2,4,6,16]
-- dobb [1,-12,3] = [2,-24,6]

dobb :: [Int] -> [Int]
dobb [] = []

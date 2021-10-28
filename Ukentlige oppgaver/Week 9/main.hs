import Data.Char

-- Oppgave A: 

-- Vi ønsker en funksjon:

-- gRep::(t->Bool)->t->[t]->[t]

-- slik at gRep pr y xs erstatter med y, ethvert element x fra listen xs som tilfredstiller predikatet pr. F.eks.:

-- gRep (<'d') 'z' 'abcd' = 'zzzd'
-- Faktisk test: gRep (<'d') 'z' "abcd"

-- gRep (=='a') 'x' "abcbcac" = 'xbcbcxc'.
-- Faktisk test: gRep (=='a') 'x' "abcbcac"

-- Gi en definisjon av gRep ved å bruke map, og en annen uten map.

-- TODO A

gRep :: (t -> Bool) -> t -> [t] -> [t]
gRep t r [s] = if t s
    then [r]
    else [s]
gRep t r (s:sx) = if t s
    then r : gRep t r sx
    else s : gRep t r sx

gRepMap :: (t->Bool)->t->[t]->[t]
gRepMap t r = map (\f -> if t f then r else f)

--Test: 
-- gRep ('d') 'z' "abcd"
-- gRep (=='a') 'x' "abcbcac"



-- Oppgave B:

-- putBoard = putBoard' 1

-- putBoard' r [] = return ()
-- putBoard' r (n:ns) = do 
--  putRow r n
--  putBoard' (r+1) ns

-- import Data.Char (Satt inn på toppen av dokumentet)

next :: Int -> Int
next 1 = 2
next 2 = 1

type Board = [Int]

initial :: Board
initial = [5,4,3,2,1]

finished :: Board -> Bool
finished = all (== 0)

valid :: Board -> Int -> Int -> Bool
valid board row num = board !! (row-1) >= num

move :: Board -> Int -> Int -> Board
move board row num = [update r n | (r,n) <- zip [1..] board]
    where update r n = if r == row then n-num else n

putRow :: Int -> Int -> IO ()
putRow row num = do
    putStr (show row)
    putStr ": "
    putStrLn (concat (replicate num "* "))

getDigit :: String -> IO Int
getDigit prompt = do
    putStr prompt
    s <- getLine
    newline
    if not (null s) && all isDigit s then return (read s)
    else do
        putStrLn "ERROR: Invalid row"
        getDigit prompt

newline :: IO ()
newline = putChar '\n'

play :: Board -> Int -> IO ()
play board player = do
    newline
    putBoard board
    if finished board then do
        newline
        putStr "Player "
        putStr (show (next player))
        putStrLn " wins!!"
    else do
        newline
        putStr "Player "
        print player
        row <- getDigit "Enter a row number: "
        num <- getDigit "Stars to remove : "
        if valid board row num then play (move board row num) (next player)
        else do
            newline
            putStrLn "ERROR: Invalid move"
            play board player

nim :: IO ()
nim = play initial 1

putBoard :: Board -> IO ()
putBoard = putBoard2 1
    -- do 
    -- putRow 1 a
    -- putRow 2 b
    -- putRow 3 c
    -- putRow 4 d
    -- putRow 5 e

-- TODO B

putBoard2 :: Int -> [Int] -> IO ()
putBoard2 r [] = return ()
putBoard2 r (n:ns) = do
    putRow r n
    putBoard2 (r+1) ns


-- Oppgave C:

-- Utvid funksjonen play :: Board -> Int -> IO (), fra “Game of nim” i boken, s.132, slik at:
-- Hver kommando fra brukeren består av to tall — ikke kun enkle siffer — skrevet i en linje, 
-- som betegner radnummer etterfulgt av antall stjerner som skal fjernes.

-- TODO C

-- play2 :: Board -> Int -> IO ()
-- play2 board player = do 
--     newline
--     putBoard board
--     if finished board then do 
--         newline
--         putStr "Player "
--         putStr (show (next player))
--         putStrLn " wins!!"
--     else do 
--         newline
--         putStr "Player "
--         putStrLn (show player)
--         row <- getDigit "Enter a row number: "
--         num <- getDigit "Stars to remove : "
--         if valid board row num then play (move board row num) (next player)
--         else do 
--             newline
--             putStrLn "ERROR: Invalid move"
--             play board player

-- Ikkje gjort noke med anna enn å skrive play2


-- Oppgave D:

-- Utvid programmet fra Oppgave B slik at dersom det første tallet er 0, så utføres operasjon “Tilbake”;
-- dvs. spillet trekkes et trekk tilbake. Dette kan gjentas helt til man kommer tilbake til spillets start.

-- TODO D

play3 :: Board -> Int -> [Board] -> IO ()
play3 board player oldState = do
    let newState = oldState ++ [board]
    newline
    putBoard board
    if finished board then do
        newline
        putStr "Player "
        putStr (show (next player))
        putStrLn " wins!!"
    else do
        newline
        putStr "Player "
        print player
        row <- getDigit "Enter a row number: "
        if row == 0 then play3 (last oldState) (next player) (init oldState) else return ()
        num <- getDigit "Stars to remove : "
        if valid board row num 
        then 
            play3 (move board row num) (next player) newState

        else do
            newline
            putStrLn "ERROR: Invalid move"
            play3 board player newState

-- For å spille; skriv "play3 initial 1 []"



-- Oppgave E:

-- Utvid programmet fra Oppgave C med en mulighet til å skrive tilstanden til en fil, 
-- og deretter hente den fra en fil for å fortsette spillet (f.eks., etter at man hadde avsluttet programmet og starter det på nytt).

-- TODO E



--  Oppgave F:

-- Bonusoppgave for spesialinteresserte:
-- Gjør nødvendige endringer for å utvide programmet slik at brukeren spiller mot maskinen 
-- og kan skrive tilstanden til en fil, hente den derfra, gjøre om ett (eller flere trekk) eller avslutte spillet. 
-- Ved oppstart oppgir brukeren antall rader det skal spilles på.

-- I første omgang, start med noen triviell strategi og bare sørg for grensesnittet og riktig fremvisning av maskinens trekk. 
-- Deretter kan du fordype deg i mulige, og optimale, strategier for nim og implementere en slik. (Du kan f.eks. bruke Wikpedia-artikkelen https://en.wikipedia.org/wiki/Nim .)

-- TODO F



import Control.Concurrent
import Data.Char

-- Main programme
main = showHanoi

-- If you want to see the machine solve towers of hanoi for n rings. 
showHanoi = do
    n <- getDigit "Enter the amount of rings: "
    printAllSteps n $ iterf (hanoi 0 1 2 n) [[1..n],[],[]]
  where
    printAllSteps _ [] = putStrLn ""
    printAllSteps n (x:xs) = do
        threadDelay 100000 --sleep for a hundred thousand microseconds, or one tenth of a second
        clr
        putStr (format n x)
        printAllSteps n xs

iterf [] x = [x]
iterf (f:fs) x = x:iterf fs (f x)

hanoi :: Int -> Int -> Int -> Int -> [[[t]] -> [[t]]]
hanoi _ _ _ 0 = []
hanoi s t d n = hanoi s d t (n - 1) ++ [move s d] ++ hanoi t s d (n - 1)

-- This method formats the towers
format :: Int -> [[Int]] -> String
format n s = format' $ pad0 s
  where
    space m = replicate m ' '
    ring m = replicate m '#'
    pad0 = map (\x -> reverse (take n (reverse x ++ repeat 0)))
    rod x = space (n - x + 1) ++ ring x ++ "|" ++ ring x ++ space (n - x + 1)
    line a b c = rod a ++ rod b ++ rod c ++ "\n"
    format' [[],[],[]] = replicate (6*n + 9) '=' ++ "\n"
    format' [x:xs, y:ys, z:zs] = line x y z ++ format' [xs, ys, zs]

-- Moves the rings according to your input
move :: Int -> Int -> ([[t]] -> [[t]])
move 0 1 = \[ah:at,b,c] -> [at,ah:b,c]
move 0 2 = \[ah:at,b,c] -> [at,b,ah:c]
move 1 2 = \[a,bh:bt,c] -> [a,bt,bh:c]
move 1 0 = \[a,bh:bt,c] -> [bh:a,bt,c]
move 2 0 = \[a,b,ch:ct] -> [ch:a,b,ct]
move 2 1 = \[a,b,ch:ct] -> [a,ch:b,ct]

getDigit :: String -> IO Int
getDigit prompt = do
    putStr prompt
    s <- getLine
    newline
    if not (null s) && all isDigit s then return (read s)
    else do
        putStrLn "ERROR: Invalid number"
        getDigit prompt

newline :: IO ()
newline = putChar '\n'

clr :: IO ()
clr = do
    putStr "\ESC[2J"
    goto 0 0

goto :: Int -> Int -> IO ()
goto x y = putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")
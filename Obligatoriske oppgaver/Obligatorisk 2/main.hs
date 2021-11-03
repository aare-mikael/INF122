import Control.Concurrent
import Data.Char
import System.Exit
import qualified Control.Monad

-- Main programme
main :: IO () -- Skal kjøre spillet når main blir skrevet i ghci-terminalen
main = do
  clr
  putStrLn "Welcome to Towers of Hanoi by Mikael."
  putStrLn "Down below you'll find all the necessary commands to play the game."
  putStrLn ""
  putStrLn ""
  putStrLn "Commands:"
  putStrLn "b n   -> n as in amount of rings, b 3 starts a game with 3 rings and so on. You can use this whenever you want to start a new game."
  putStrLn "q     -> quits the game. You can use this whenever you want to leave the terminal."
  putStrLn "f t   -> f as in the rod you want to move from, t as in the rod you want to move to. Not applicable until you've started a game with b n."
  putStrLn "z n   -> n as in the amount of moves you want to go back. Put n above amount of moves already executed to restart the game. Not applicable until you've started a game with b n."
  -- putStrLn "h     -> gives recommendation for next move. NOT IMPLEMENTED YET"
  putStrLn "Good luck!"
  putStrLn ""
  input <- getLine
  case words input of
    ["b",number] -> do
      let n = read number :: Int
      if n == 0 then do
        putStr "Why would you play Towers of Hanoi with 0 rings?"
        newline
        threadDelay 1000000
        main
      else do
        let board = generate n
        clr
        playHanoi n (generate n) [generate n] 0

-- Moves the rings according to your input
move :: Int -> Int -> ([[t]] -> [[t]])
move 0 1 = \[ah:at,b,c] -> [at,ah:b,c]
move 0 2 = \[ah:at,b,c] -> [at,b,ah:c]
move 1 2 = \[a,bh:bt,c] -> [a,bt,bh:c]
move 1 0 = \[a,bh:bt,c] -> [bh:a,bt,c]
move 2 0 = \[a,b,ch:ct] -> [ch:a,b,ct]
move 2 1 = \[a,b,ch:ct] -> [a,ch:b,ct]

-- Game loop
playHanoi :: Int -> Board -> [Board] -> Int -> IO ()
playHanoi n board oldState steps = do
  putStrLn (format n board)
  fin <- finished n board
  if fin then do
    putStr "Congratulations with completing Towers of Hanoi with "
    putStr (show n)
    putStr " rings and "
    putStr (show steps)
    putStr " steps!"
    newline 
    threadDelay 5000000 -- 5 seconds delay
    main
  else do
  putStr "Steps so far: "
  putStr (show steps) >> newline
  putStrLn "Enter your command: "
  text <- getLine
  clr
  case words text of
    ["b",number] -> do
      let n = read number :: Int
      if n == 0
      then do
        putStr "Why would you play Towers of Hanoi with 0 rings?"
        newline
        threadDelay 1000000
        playHanoi n board oldState steps
      else do
        -- let board = format n [[1..n],[],[]]
        let board = generate n
        clr
        playHanoi n board [generate n] 0
    ["z",regret] -> do
      let r = read regret :: Int
      if r == 0 then do
        putStrLn "What did you think would happen when undoing 0 steps?"
        newline
        threadDelay 1000000
        playHanoi n board oldState steps
      else do
        if length oldState < r then do
          let l = length oldState - 1
          let newOldState = undo l oldState
          clr
          if (steps - r) <= 0 then do
            let s = steps
            playHanoi n (last newOldState) newOldState (steps-s)
          else do
            let s = r
            playHanoi n (last newOldState) newOldState (steps-s)
        else do
          let l = r
          let newOldState = undo l oldState
          clr
          if (steps - r) <= 0 then do
            let s = steps
            playHanoi n (last newOldState) newOldState (steps-s)
          else do
            let s = r
            playHanoi n (last newOldState) newOldState (steps-s)
    ["q"] -> do
      putStr "You've entered the command for exiting the program!"
      exitSuccess
    [first, target] -> do
      let f = read first :: Int
      let t = read target :: Int
      val <- valid f t board
      if val
        then do
        let newBoard = move (f-1) (t-1) board
        let newState = oldState ++ [newBoard]
        playHanoi n newBoard newState (steps + 1)
      else do
        putStr "Sorry mate, but that move's not legal. Try again!"
        putStrLn ""
        playHanoi n board oldState steps

-- Undoes n moves, resets board if n is bigger than oldState length (i.e. you've made 5 moves, and write "z 643")
undo :: Int -> [Board] -> [Board]
undo 0 x = x
undo 1 x = init x
undo n x = undo (n-1) (init x)

-- Checks if a move is valid
valid :: Int -> Int -> [[Int]] -> IO Bool
valid first target board
  | (first < 1 ) ||  (first > 3) || (target < 1 ) ||  (target > 3) = do return False
  | null (board !! (first-1)) = do return False
  | null (board !! (target-1)) = do return True
  | head (board !! (first-1)) > head (board !! (target-1)) = do return False
  | otherwise =
  do return True

-- Checks if a game is finished
finished :: Int -> [[Int]] -> IO Bool
finished rings board = 
  if board == completed rings then do 
    return True
  else
    return False

-- Type Board for initial board
type Board = [[Int]]
initial :: Board
initial = [[]]

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

-- Generates double array with n length in first index
generate n = [[1..n],[],[]]

-- Generates double array with n length in last index
completed n = [[],[],[1..n]]

-- If you want to see the machine solve towers of hanoi for n rings, write showHanoi, and n rings when prompted. 
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
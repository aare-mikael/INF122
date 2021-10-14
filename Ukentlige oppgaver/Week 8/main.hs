import System.IO

-- Clearing cmd-window by entering clr in ghci
clr :: IO ()
clr = do
  putStr "\ESC[2J"
  goto 0 0

goto :: Int -> Int -> IO ()
goto x y = putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")

writeAt (x,y) xs = do
  goto x y
  putStr xs

{-
Oppgave A:
Programmer en aksjon som tar inn høyde og printer en rettvinklet trekant med kateter = høyde, slik: 

    trekant :: Int -> IO ()

    trekant 4 => 
    *
    * *
    * * *
    * * * *

    trekant 6 => 
    *
    * *
    * * *
    * * * *
    * * * * *
    * * * * * *
-}

trekant :: Int -> IO ()
trekant n = putStr(reverse (trekantbygging n))


-- stjerne :: Int -> String 
stjerne 0 = ""
stjerne 1 = "*"
stjerne n = "* " ++ stjerne (n - 1)

nylinje = "\n"

trekantbygging 0 = []
trekantbygging 1 = nylinje ++ stjerne 1
trekantbygging n = nylinje ++ stjerne n ++ trekantbygging (n-1)

{-
Oppgave B: 
Få trekanten til å stå "rett" som et juletre, slik:
     *
    * *
   * * *
  * * * *
 * * * * *
* * * * * *
-}

trekantB :: Int -> IO ()
trekantB n = trekantHelper n 1

indeksering :: Int -> IO ()
indeksering 0 = putStr (concat (replicate 0 " "))
indeksering n = putStr (concat (replicate n " "))

trekantHelper n x =
  if n == 0
    then return ()
  else indeksering (n-1) >> rad x >> trekantHelper (n-1) (x+1)

rad :: Int -> IO ()
rad 0 = putStrLn ""
rad x = putStrLn(stjerne x)




-- Oppgave C:
-- Innleveringsoppgave
-- Generaliser funksjonen fra B til en som tar 3 tall som argumenter og tegner 3 slike
-- trekanter ved siden av hverandre:
-- trekanter :: Int -> Int -> Int -> IO ()
-- Input tallene trenger ikke være sortert. F.eks.
-- trekanter 3 5 2
-- bør gi output som følger:
--             *
--            * *
--   *       * * *
--  * *     * * * *     *
-- * * *   * * * * *   * * 

trekantC :: Int -> Int -> Int -> IO ()
trekantC 0 0 0 = putStr "Can't draw triangles that are 0 in size"
-- trekantC a b c = 

trekanterHelper :: Int -> (Int, Int) -> IO ()
trekanterHelper 0 (0, 0) = putStr"!! Ugyldig posisjon !!"
-- trekanterHelper n (x, y) = concat (replicate n (x, y))

-- I've tried for a combined duration of around 29 hours, and not once did I come even close to a solution. 
-- Task A and B works, but for the life of me I can't fathom a way to draw the three triangles on the same line.
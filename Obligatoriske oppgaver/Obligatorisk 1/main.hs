-- Mikael Aare
module Oblig1 where

dictionary = [
        ("bb",["Big Brother"]),
        ("dep",["department"]),
        ("sec", ["Sector"]),
        ("doubleplusgood",["excellent", "fabulous", "fantastic", "best"]),
        ("doubleplusungood", ["terrible", "horrible", "worst"]),
        ("Ingsoc", ["English Socialism"]),
        ("joycamp", ["labour camp"]),
        ("Oldspeak", ["Standard English", "English"]),
        ("oldthink", ["objectivity", "rationalism", "democracy"]),
        ("thinkpol", ["The Thought Police"]),
        ("prolefeed", ["Popular culture", "pop-culture"]),
        ("crimethink", ["liberty", "equality", "privacy", "thoughtcrime"]),
        ("fullwise", ["fully", "completely", "totally"]),
        ("goodthink", ["political orthodoxy", "politically orthodox thought", "orthodox thought"]),
        ("goodwise", ["well"]),
        ("ownlife", ["anti-social tendency", "solitude", "individualism"]),
        ("plusgood", ["very good", "great"]),
        ("plusungood", ["very bad"]),
        ("misprint", ["error", "misprediction"]),
        ("Miniluv", ["The Ministry of Love"]),
        ("Minipax", ["The Ministry of Peace"]),
        ("Minitrue", ["The Ministry of Truth"]),
        ("Miniplenty", ["The Ministry of Plenty"]),
        ("bellyfeel", ["blind, enthusiastic acceptance"]),
        ("doublethink", ["believing two contradictory ideas"]),
        ("duckspeak", ["vocal support of political orthodoxies"]),
        ("un", ["not"]),
        ("peace", ["war"]),
        ("strength", ["ignorance"]),
        -- The next line contains a list of forbidden words that don't have a translation to Newspeak, these should be replaced with '*'s
        ("",["freedom", "revolution", "fun", "diary", "surveillance", "Great Britain", "Winston Smith", "Julia"])
        ]


-- Oppgave 1 ----------------------------------------------------
isPrefix :: String -> String -> Bool
isPrefix xs ys = take (length xs) ys == xs

isPrefix2 :: String -> String -> Bool 
isPrefix2 [] ys = True 
isPrefix2 xs [] = False 
isPrefix2 (x:xs) (y:ys)
        | x == y        = isPrefix2 xs ys
        | otherwise     = False

-- These two functions, isPrefix and isPrefix2 do the same thing, one is just easier to understand than the other.


-- Oppgave 2 ----------------------------------------------------
position :: String -> [Char] -> [(Int, Int)] -> Int -> [(Int, Int)]
position xs [] exs n = exs
position xs ys exs n = 
        if isPrefix xs ys
        then
                exs ++ [(n, n + length xs)] ++ position xs (tail ys) exs (n + 1)
        else 
                position xs (tail ys) exs (n + 1)

locate :: String -> String -> [(Int, Int)]
locate [] ys = [(0,length ys)]
locate xs [] = [(length xs,0)]
locate xs ys = position xs ys [] 0


-- Oppgave 3 ----------------------------------------------------
translate :: String -> String 
translate xs = lookthrough xs dictionary 

lookthrough [] dictionary = []
lookthrough xs [] = []
lookthrough xs dictionary = 
        if any (\x -> length x == length xs && isPrefix x xs) (snd(head dictionary))
        then
                fst (head dictionary)
        else
                lookthrough xs (tail dictionary)


-- Oppgave 4 ----------------------------------------------------
replace :: [(Int,Int)] -> String -> String 
replace = undefined


-- Oppgave 5 ----------------------------------------------------
toNewspeak :: String -> String 
toNewspeak = translate


-- Oppgave 6 ----------------------------------------------------
analytics :: String -> String -> Int 
analytics xs ys = 100 * length ys `div` length xs


-- Oppgave 7 ----------------------------------------------------
main :: String -> (String, Int)
main xs = (toNewspeak xs, analytics xs (toNewspeak xs))


{-
Author comment here; I tried for hours and hours, but could not fathom how I should go about doing task 4. The rest should be working just fine without it though.
-}
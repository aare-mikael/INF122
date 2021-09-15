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
isPrefix1 :: String -> String -> Bool 
isPrefix1 [] ys = True 
isPrefix1 xs [] = False 
isPrefix1 (x:xs) (y:ys)
        | x == y        = isPrefix1 xs ys
        | otherwise     = False

isPrefix2 :: String -> String -> Bool 
isPrefix2 xs ys = take (length xs) ys == xs

isPrefix1 xs ys | x == y - isPrefix1 (tail xs) (tail ys)


-- Oppgave 2 ----------------------------------------------------
locate :: String -> String -> [(Int, Int)]
locate [] ys = []
locate xs [] = []


-- Oppgave 3 ----------------------------------------------------
translate :: String -> String 
translate = undefined 


-- Oppgave 4 ----------------------------------------------------
replace :: [(Int,Int)] -> String -> String 
replace = undefined


-- Oppgave 5 ----------------------------------------------------
toNewspeak :: String -> String 
toNewspeak = undefined


-- Oppgave 6 ----------------------------------------------------
analytics :: String -> String -> Int 
analytics = undefined


-- Oppgave 7 ----------------------------------------------------
main :: String -> (String, Int)
main = undefined

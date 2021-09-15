-- Oppgave C
s :: (a -> b -> c) -> (a -> b) -> a -> c
s = \ f g x -> f x (g x)

k :: d -> e -> d
k = \ x y -> x


-- Oppgave F
rem1 :: Eq a -> [a] -> a -> [a] 
rem1 [] _ = []
rem1 (x:xs) y | x == y = xs
              | otherwise - x : rem1 xs y
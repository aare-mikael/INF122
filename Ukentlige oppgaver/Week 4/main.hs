s :: (a -> b -> c) -> (a -> b) -> a -> c
s = \ f g x -> f x (g x)

k :: a -> b -> a
k = \ x y -> x

c :: a -> a
c = s k k





rem1 :: Eq a => 
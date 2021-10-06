-- Oppgave A
data Ast = V Int | P Ast Ast | M Ast Ast

eval :: Ast -> Int
eval (V a) = a
eval (P a b) = eval a + eval b
eval (M a b) = eval a * eval b

-- Tests:
-- eval (V 5) = 5
-- eval (P (V 54) (M (V 2) (V 3)) ) = 54 + (2 * 3) = 60
-- eval (M (P (V 12) (V 3)) (M (V 2) (V 5)) ) =  (12+3) * (2 * 5) = 150


-- Oppgave B
evalb :: Ast -> Bool
evalb (V a) = eval (V a) `mod` 2 == 1
evalb (P a b) = evalb a || evalb b
evalb (M a b) = evalb a && evalb b

-- Tests:
-- evalb (V 5) = False
-- evalb (P (V 54) (M (V 2) (V 3)) ) = False || (True && False) = False
-- evalb (M (P (V 12) (V 3)) (M (V 3) (V 5)) ) =  (False || True) && (True && True) = True


-- Oppgave C

vi :: p -> p
vi a = a
pi :: Num a => a -> a -> a
pi a b = a + b
mi :: Num a => a -> a -> a
mi a b = a * b
vb :: Integral a => a -> Bool
vb a = a `mod` 2 == 1
pb :: Ast -> Ast -> Bool
pb a b = evalb a || evalb b
mb :: Ast -> Ast -> Bool
mb a b = evalb a && evalb b
vStr :: Show a => a -> String
vStr = show
pStr :: [Char] -> [Char] -> [Char]
pStr a b = a ++ " + " ++ b
mStr :: [Char] -> [Char] -> [Char]
mStr a b = "(" ++ a ++ "*" ++ b ++ ")"

ev :: Ast -> (Int -> a) -> (a -> a -> a) -> (a -> a -> a) -> a
ev (V a) v p m = v a
ev (P a b) v p m = ev a v p m `p` ev b v p m
ev (M a b) v p m = ev a v p m `m` ev b v p m

-- Tests:
-- ev (V 5) vStr pStr mStr
-- ev (P (V 55) (M (V 2) (V 3)) )  vStr pStr mStr
-- ev (M (P (V 12) (V 3)) (M (V 2) (V 5))) vStr pStr mStr

-- Oppgave D
data Expr = Val Int | Add Expr Expr

-- folde f g x
-- folde f _ x = 
-- folde f g x = 

-- folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
-- folde f g (Val n) = 
-- folde f g (Add a b) =
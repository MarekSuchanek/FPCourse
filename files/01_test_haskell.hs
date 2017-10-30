{-
   This is first Haskell source file to be tested out with GHCi

   BTW This is multiline comment
-}


-- First function: Linear function for Integers
linear :: Integer -> Integer -> Integer -> Integer
linear a b x = a * x + b

-- Second function: check if three lenghts form triangle
isTriangle :: Double -> Double -> Double -> Bool
isTriangle a b c = (a + b > c) && (a + c > b) && (b + c > a)

-- Added function
isntTriangle a b c = not (isTriangle a b c)


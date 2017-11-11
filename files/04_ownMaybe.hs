data IntOrNot = I Int | NoInt
data StringOrNot = S String | NoString
data ValueOrNot a = Value a | NoValue

myDiv     :: Int -> Int -> ValueOrNot Int
myDiv x 0 = NoValue
myDiv x y = Value (x `div` y)

divString :: Int -> Int -> String
divString x y = case (myDiv x y) of
                  NoValue   -> "Division by zero is not allowed!"
                  Value res -> "Result: " ++ (show res)

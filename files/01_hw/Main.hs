import HWLib

main = do
    putStrLn "Enter your name:"
    name <- getLine
    putStrLn (greet name)

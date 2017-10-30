module Main where

import Lib

main :: IO ()
main = do
    putStrLn "Enter your name:"
    name <- getLine
    putStrLn (greet name)

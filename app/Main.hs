{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Lib
import FileManipulation

main :: IO ()
main = do
  someFunc
  writeTXT "test.txt" "Hello, HaskDocCraft!"
  readFile "test.txt" >>= putStrLn
  appendTXT "test.txt" "\nHello, HaskDocCraft!"
  scotty 3000 $ do
    get "/" $ do
      text "Hello, HaskDocCraft!"

module FileManipulation
    ( writeTXT
    , readTXT
    , appendTXT
    ) where

import Control.Exception (try, IOException)
import System.IO

writeTXT :: String -> String -> IO ()
writeTXT fileName content = do
    result <- try (withFile fileName WriteMode (\handle -> hPutStr handle content)) :: IO (Either IOException ())
    case result of
        Left e -> putStrLn $ "[ERROR] Failed to write file: " ++ show e
        Right _ -> putStrLn "[OK] File written successfully!"

readTXT :: String -> IO ()
readTXT fileName = do
    result <- try (withFile fileName ReadMode hGetContents) :: IO (Either IOException String)
    case result of
        Left e -> putStrLn $ "[ERROR] Failed to read file: " ++ show e
        Right fileContent -> do
            putStrLn fileContent
            putStrLn "[OK] File read successfully!"

appendTXT :: String -> String -> IO ()
appendTXT fileName content = do
    result <- try (withFile fileName AppendMode (\handle -> hPutStr handle content)) :: IO (Either IOException ())
    case result of
        Left e -> putStrLn $ "[ERROR] Failed to append content to file: " ++ show e
        Right _ -> putStrLn "[OK] Content appended successfully!"

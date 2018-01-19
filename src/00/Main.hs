module Main where

import           Data.ByteString.Lazy       (ByteString)
import qualified Data.ByteString.Lazy.Char8

preview :: ByteString -> ByteString
preview =
  Data.ByteString.Lazy.Char8.unlines
  . take 3
  . Data.ByteString.Lazy.Char8.lines

process :: FilePath -> IO ()
process file = do
  bytes <- Data.ByteString.Lazy.Char8.readFile file
  Data.ByteString.Lazy.Char8.putStr (preview bytes)

main :: IO ()
main = do
  process "./data/holothuriidae-specimens.csv"
  putStrLn ""
  process "./data/holothuriidae-nomina-valid.csv"

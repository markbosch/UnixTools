-- WordCount: wc
-- Coding Challenge: https://codingchallenges.fyi/challenges/challenge-wc/

import System.Environment(getArgs)
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as C
import qualified Data.Text.Encoding as E
import qualified Data.Text as T

main :: IO ()
main = do
    args <- getArgs
    case args of
        ["-c", file] -> handleFileInput getBytes file
        ["-c"] -> handleStdInput getBytes
        ["-l", file] -> handleFileInput getLines file
        ["-l"] -> handleStdInput getLines
        ["-w", file] -> handleFileInput getWords file
        ["-w"] -> handleStdInput getWords
        ["-m", file] -> handleFileInput getChars file
        ["-m"] -> handleStdInput getChars
        [file] -> handleFileInput defaultOption file
        [] -> handleStdInput defaultOption
        _ -> putStrLn usage

handleFileInput :: (B.ByteString -> String) -> String -> IO ()
handleFileInput option file =
    B.readFile file >>= \content ->
        putStrLn $ "  " ++ option content ++ " " ++ file

handleStdInput :: (B.ByteString -> String) -> IO ()
handleStdInput option = B.getContents >>=
    \content -> putStrLn $ "  " ++ option content

-- |Get the number of bytes from a ByteString
getBytes :: B.ByteString -> String
getBytes = show . B.length

-- |Get the number of lines from a ByteString
getLines :: B.ByteString -> String
getLines = show . length . C.lines

-- |Get the number of words from a ByteString
getWords :: B.ByteString -> String
getWords = show . length . C.words

-- |Get the number of characters from a ByteString
getChars :: B.ByteString -> String
getChars = show . T.length . E.decodeUtf8

-- |Get the default option which is lines, words, and bytes
defaultOption :: B.ByteString -> String
defaultOption content =
    getLines content ++ "  " ++  getWords content ++ "  " ++ getBytes content

usage :: String
usage = "usage: wc [-c|-l|-w|-m] <file>"

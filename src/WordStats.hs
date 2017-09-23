module WordStats
    ( wordCounts
    , totalWordCount
    , uniqueWordCount
    , totalCharCount
    , spacelessCharCount
    ) where

import Data.Char
import Data.List

totalCharCount :: String -> Int
totalCharCount = length

spacelessCharCount :: String -> Int
spacelessCharCount = length . filter (\x -> not $ isSpace x)

totalWordCount :: String -> Int
totalWordCount = length . words

wordCounts :: String -> [String] -> [(String, Int)]
wordCounts input stopWords = parse input
    where parse = wc . nub . withoutStop . map lower . map trim . words
          withoutStop = filter (\x -> notElem x stopWords)

uniqueWordCount :: String -> Int
uniqueWordCount = length . nub . map lower . map trim . words

trim :: String -> String
trim = filter isAlpha

lower :: String -> String
lower = map toLower

wc :: [String] -> [(String, Int)]
wc l = map counts l
    where counts y = (y, length $ filter (\x -> x == y) l)

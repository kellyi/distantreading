module WordStats
    ( wordCounts
    , totalWordCount
    , uniqueWordCount
    , totalCharCount
    , spacelessCharCount
    ) where

import qualified Data.Char as DC
import qualified Util as DRUtil

totalCharCount :: String -> Int
totalCharCount = length

spacelessCharCount :: String -> Int
spacelessCharCount = length . filter (\x -> not $ DC.isSpace x)

totalWordCount :: String -> Int
totalWordCount = length . words

wordCounts :: String -> [(String, Int)]
wordCounts = wc . DRUtil.toWords

uniqueWordCount :: String -> Int
uniqueWordCount = length . DRUtil.toWords

wc :: [String] -> [(String, Int)]
wc l = map counts l
    where counts y = (y, length $ filter (\x -> x == y) l)

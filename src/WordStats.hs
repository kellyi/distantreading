module WordStats
    ( wordCounts
    , totalWordCount
    , uniqueWordCount
    , totalCharCount
    , spacelessCharCount
    ) where

import qualified Data.Char as DC
import qualified Data.List as DL
import qualified Util as DRUtil

totalCharCount :: String -> Int
totalCharCount = length

spacelessCharCount :: String -> Int
spacelessCharCount = length . filter (\x -> not $ DC.isSpace x)

totalWordCount :: String -> Int
totalWordCount = length . words

uniqueWordCount :: String -> Int
uniqueWordCount = length . DRUtil.toUniqueWords

wordCounts :: [String] -> [(String, Int)]
wordCounts l = map counts $ DL.nub l
    where counts y = (y, length $ filter (\x -> x == y) l)

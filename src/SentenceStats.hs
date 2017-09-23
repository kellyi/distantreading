module SentenceStats
    ( sentenceCount
    , averageSentenceLength
    , longestSentence
    , shortestSentence
    ) where

import Data.Char
import Data.List
import Data.Ord
import Data.List.Split

sentenceCount :: String -> Int
sentenceCount = length . sentences

sentences :: String -> [String]
sentences = map trim . filter (\x -> x /= "") . split (keepDelimsR $ oneOf "?!.")

trim :: String -> String
trim = reverse . trimLeft . reverse . trimLeft

trimLeft :: String -> String
trimLeft "" = ""
trimLeft w@(x:xs)
    | isSpace x = trimLeft xs
    | otherwise = w

averageSentenceLength :: String -> Int
averageSentenceLength = findMeanSentenceLength 0 0 . sentences

findMeanSentenceLength :: Int -> Int -> [String] -> Int
findMeanSentenceLength lengths count [] = div lengths count
findMeanSentenceLength l c (x:xs) = findMeanSentenceLength newL newC xs
    where newL = (+) l $ length x
          newC = succ c

longestSentence :: String -> String
longestSentence = maximumBy (comparing length) . sentences

shortestSentence :: String -> String
shortestSentence = minimumBy (comparing length) . sentences

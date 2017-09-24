module SentenceStats
    ( sentenceCount
    , averageSentenceLength
    , longestSentence
    , shortestSentence
    ) where

import qualified Data.Char as DC
import qualified Data.List as DL
import qualified Data.Ord as DO
import qualified Data.List.Split as DLS

sentenceCount :: String -> Int
sentenceCount = length . sentences

sentences :: String -> [String]
sentences = map trim . filter (\x -> x /= "") . DLS.split (DLS.keepDelimsR $ DLS.oneOf "?!.")

trim :: String -> String
trim = reverse . trimLeft . reverse . trimLeft

trimLeft :: String -> String
trimLeft "" = ""
trimLeft w@(x:xs)
    | DC.isSpace x = trimLeft xs
    | otherwise = w

averageSentenceLength :: String -> Int
averageSentenceLength = findMeanSentenceLength 0 0 . sentences

findMeanSentenceLength :: Int -> Int -> [String] -> Int
findMeanSentenceLength lengths count [] = div lengths count
findMeanSentenceLength l c (x:xs) = findMeanSentenceLength newL newC xs
    where newL = (+) l $ length x
          newC = succ c

longestSentence :: String -> String
longestSentence = DL.maximumBy (DO.comparing length) . sentences

shortestSentence :: String -> String
shortestSentence = DL.minimumBy (DO.comparing length) . sentences

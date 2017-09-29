module Util
    ( toWords
    , toUniqueWords
    ) where

import qualified Data.Char as DC (isAlpha, toLower,)
import qualified Data.List as DL (nub,)

toUniqueWords :: String -> [String]
toUniqueWords = DL.nub . toWords

toWords :: String -> [String]
toWords = map lower . map trim . words

trim :: String -> String
trim = filter DC.isAlpha

lower :: String -> String
lower = map DC.toLower

module Util
    ( toWords
    ) where

import qualified Data.Char as DC (isAlpha, toLower,)
import qualified Data.List as DL (nub,)

toWords :: String -> [String]
toWords = DL.nub . map lower . map trim . words

trim :: String -> String
trim = filter DC.isAlpha

lower :: String -> String
lower = map DC.toLower

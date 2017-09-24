module Lib
    ( someFunc
    ) where

import qualified WordStats as Words
import qualified SentenceStats as Sentences
import qualified StopWords as StopWords

someFunc :: IO ()
someFunc = putStrLn "someFunc"

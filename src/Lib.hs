module Lib
    ( wordStatsFromFile
    , sentenceStatsFromFile
    ) where

import Data.List

import qualified WordStats as Words
import qualified SentenceStats as Sentences
import qualified StopWords as StopWords
import qualified Util as Util
import qualified Response as Response

wordStatsFromFile :: FilePath -> IO ()
wordStatsFromFile f = do
    r <- readFile f
    Response.createWordResponseForFile r

sentenceStatsFromFile :: FilePath -> IO ()
sentenceStatsFromFile f = do
    r <- readFile f
    Response.createSentenceResponseForFile r

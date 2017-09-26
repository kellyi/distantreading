module Lib
    ( fileStats
    ) where

import Data.List

import qualified WordStats as Words
import qualified SentenceStats as Sentences
import qualified StopWords as StopWords
import qualified Util as Util
import qualified Response as Response

fileStats :: FilePath -> IO ()
fileStats f = do
    r <- readFile f
    Response.createResponse r

{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}

module Response
    ( createResponse
    ) where

import GHC.Generics
import Data.Aeson
import qualified Data.Text.Lazy.IO as T
import qualified Data.Text.Lazy.Encoding as T

import qualified WordStats as Words
import qualified SentenceStats as Sentences
import qualified StopWords as StopWords
import qualified Util as Util

data Res = Res
    { sentenceCount :: Int
    , averageSentenceLength :: Int
    , longestSentence :: String
    , shortestSentence :: String
    , totalCharCount :: Int
    , spacelessCharCount :: Int
    , totalWordCount :: Int
    , uniqueWordCount :: Int
    , wordCounts :: [(String, Int)]
    } deriving (Generic, Show)

instance ToJSON Res
instance FromJSON Res

createResponse :: String -> IO ()
createResponse s = T.putStrLn . T.decodeUtf8 . encode $ resp
    where resp = (Res count average long short char spaceless word unique wc)
          count = Sentences.sentenceCount s
          average = Sentences.averageSentenceLength s
          long = Sentences.longestSentence s
          short = Sentences.shortestSentence s
          char = Words.totalCharCount s
          spaceless = Words.spacelessCharCount s
          word = Words.totalWordCount s
          unique = Words.uniqueWordCount s
          wc = Words.wordCounts s

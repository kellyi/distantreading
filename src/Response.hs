{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}

module Response
    ( createWordResponseForUrls
    , createWordResponseForFile
    , createSentenceResponseForUrls
    , createSentenceResponseForFile
    , SentenceResponse
    , WordResponse
    ) where

import GHC.Generics
import Data.Aeson
import qualified Data.Text.Lazy.IO as T
import qualified Data.Text.Lazy.Encoding as T

import qualified WordStats as Words
import qualified SentenceStats as Sentences
import qualified StopWords as StopWords
import qualified Util as Util

data WordResponse = WordResponse
    { totalWordCount :: Int
    , uniqueWordCount :: Int
    , wordCounts :: [(String, Int)]
    } deriving (Generic, Show)

instance ToJSON WordResponse
instance FromJSON WordResponse

data SentenceResponse = SentenceResponse
    { sentenceCount :: Int
    , averageSentenceLength :: Int
    , longestSentence :: String
    } deriving (Generic, Show)

instance ToJSON SentenceResponse
instance FromJSON SentenceResponse

createWordResponseForUrls :: [String] -> IO ()
createWordResponseForUrls urls = undefined

createSentenceResponseForUrls :: [String] -> IO ()
createSentenceResponseForUrls urls = undefined

createWordResponseForFile :: String -> IO ()
createWordResponseForFile s = T.putStrLn . T.decodeUtf8 .encode $ resp
    where resp = (WordResponse total unique wc)
          total = Words.totalWordCount s
          unique = Words.uniqueWordCount s
          wc = Words.wordCounts $ s

createSentenceResponseForFile :: String -> IO ()
createSentenceResponseForFile s = T.putStrLn . T.decodeUtf8 . encode $ resp
    where resp = (SentenceResponse count average longest)
          count = Sentences.sentenceCount s
          average = Sentences.averageSentenceLength s
          longest = Sentences.longestSentence s

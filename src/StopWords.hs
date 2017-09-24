{-# LANGUAGE OverloadedStrings #-}

module StopWords
    ( removeStopWords
    ) where

import Network.Wreq
import Control.Lens
import qualified Data.List.Split as DLS
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as BSL
import qualified Data.ByteString.Char8 as C
import qualified Data.Word as W
import qualified Data.Text as T
import qualified Data.Text.Encoding as E

import qualified Util as DRUtil

removeStopWords :: String -> IO [String]
removeStopWords w = do
    sw <- stopWords
    return $ filter (\x -> notElem x sw) $ DRUtil.toWords w

-- Stop words list from https://github.com/agoldst/dfr-analysis
dataUrl :: String
dataUrl = "https://raw.githubusercontent.com/agoldst/dfr-analysis/master/stoplist/long-multilang.txt"

lineBreak :: [W.Word8]
lineBreak = BS.unpack $ C.pack "\n"

stopWords :: IO [String]
stopWords = do
    r <- get dataUrl
    return $ (map asciiToText $ (splitResponse $ r  ^. responseBody))

asciiToText :: [W.Word8] -> String
asciiToText = T.unpack . E.decodeUtf8 . BS.pack

splitResponse :: BSL.ByteString -> [[W.Word8]]
splitResponse = DLS.splitOn lineBreak . BS.unpack . BSL.toStrict

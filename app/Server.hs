{-# LANGUAGE OverloadedStrings #-}

import Data.Monoid (mconcat)
import qualified Web.Scotty as SC
import qualified Data.Text.Lazy.IO as T
import qualified Data.Text.Lazy.Encoding as T

import qualified Lib as Lib
import qualified Request as Request

main :: IO ()
main = do SC.scotty 4444 router

router :: SC.ScottyM ()
router = do
  SC.post "/words" $ do
    req <- SC.jsonData :: SC.ActionM Request.Req
    SC.json $ req
  SC.post "/sentences" $ do
    req <- SC.jsonData :: SC.ActionM Request.Req
    SC.json $ req
  SC.notFound $ SC.text $ mconcat ["distant reading"]

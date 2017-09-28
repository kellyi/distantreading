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
  SC.post "/run" $ do
    req <- SC.jsonData :: SC.ActionM Request.Req
    SC.json $ req
  SC.get "/" $ SC.text $ mconcat ["Helo world!"]
  SC.notFound $ SC.text $ mconcat ["that endpoint is not yet implemented"]

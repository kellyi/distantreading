{-# LANGUAGE OverloadedStrings #-}

import Data.Monoid (mconcat)
import qualified Web.Scotty as SC

import qualified Lib as Lib

main :: IO ()
main = do SC.scotty 3000 router

router :: SC.ScottyM ()
router = do
  SC.get "/run" $ SC.text $ mconcat ["/run endpoint placholder"]
  SC.notFound $ SC.text $ mconcat ["that endpoint is not yet implemented"]

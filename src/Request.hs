{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}

module Request
    ( Req
    ) where

import GHC.Generics
import Data.Aeson

data Req = Req
    { url :: String
    } deriving (Show, Generic)

instance ToJSON Req
instance FromJSON Req

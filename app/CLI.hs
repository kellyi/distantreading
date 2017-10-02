{-# LANGUAGE OverloadedStrings #-}

module Main where

-- optionparse setup from https://github.com/pcapriotti/optparse-applicative#quick-start
import Options.Applicative
import Data.Semigroup ((<>))

import qualified Lib as Lib

data Opt = Opt
    { target :: String
    , sentence :: Bool }

optarg :: Parser Opt
optarg = Opt
      <$> strOption
           ( long "target"
          <> metavar "TARGET"
          <> help "Target file" )
      <*> switch
           ( long "sentence"
          <> short 's'
          <> help "Get sentence stats instead of word stats" )

main :: IO ()
main = parse =<< execParser opts
  where
    opts = info (optarg <**> helper)
      ( fullDesc
     <> progDesc "Generate statistics about a text file"
     <> header "distantreading" )

parse :: Opt -> IO ()
parse (Opt file False) = Lib.wordStatsFromFile file
parse (Opt file True) = Lib.sentenceStatsFromFile file

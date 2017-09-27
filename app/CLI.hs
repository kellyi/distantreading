{-# LANGUAGE OverloadedStrings #-}

module Main where

-- optionparse setup from https://github.com/pcapriotti/optparse-applicative#quick-start
import Options.Applicative
import Data.Semigroup ((<>))

import qualified Lib as Lib

data Opt = Opt { target :: String }

optarg :: Parser Opt
optarg = Opt
      <$> strOption
           ( long "target"
          <> metavar "TARGET"
          <> help "Target file" )

main :: IO ()
main = parse =<< execParser opts
  where
    opts = info (optarg <**> helper)
      ( fullDesc
     <> progDesc "Generate statistics about a text file"
     <> header "distantreading" )

parse :: Opt -> IO ()
parse (Opt file) = Lib.fileStats file

{-# LANGUAGE OverloadedStrings #-}

module Main where

-- optionparse setup from https://github.com/pcapriotti/optparse-applicative#quick-start
import Options.Applicative
import Data.Semigroup ((<>))
import Data.Monoid (mconcat)
import qualified Web.Scotty as SC

import qualified Lib as Lib

data Opt = Opt
    { target :: String
    , server :: Bool }

optarg :: Parser Opt
optarg = Opt
      <$> strOption
           ( long "target"
          <> metavar "TARGET"
          <> help "Target file" )
      <*> switch
          ( long "server"
         <> short 's'
         <> help "Run server instead of command line interface" )

main :: IO ()
main = parse =<< execParser opts
  where
    opts = info (optarg <**> helper)
      ( fullDesc
     <> progDesc "Generate statistics about a text file"
     <> header "distantreading" )

parse :: Opt -> IO ()
parse (Opt _ True) = SC.scotty 3000 router
parse (Opt f False) = Lib.fileStats f
parse _ = putStrLn $ "Placeholder for running command line interface!"

router :: SC.ScottyM ()
router = do
  SC.get "/run" $ SC.text $ mconcat ["/run endpoint placholder"]
  SC.notFound $ SC.text $ mconcat ["that endpoint is not yet implemented"]

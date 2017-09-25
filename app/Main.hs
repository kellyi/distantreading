module Main where

-- optionparse setup from https://github.com/pcapriotti/optparse-applicative#quick-start
import Options.Applicative
import Data.Semigroup ((<>))

import Lib

data Opt = Opt { server :: Bool }

optarg :: Parser Opt
optarg = Opt
      <$> switch
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
parse (Opt True) = putStrLn $ "Placeholder for running the server!"
parse _ = putStrLn $ "Placeholder for running command line interface!"

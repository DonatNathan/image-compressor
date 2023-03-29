module Compressor where

import ErrorHandling

import System.Exit

startCompressor :: Int -> Float -> String -> IO ()
startCompressor a b c = if (errorHandlingValues a b c) == False then exitWith(ExitFailure 84) else do
    putStrLn "Image compressor starting..."

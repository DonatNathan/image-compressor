--
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- Main
--

module Main (main) where

import Compressor
import ErrorHandling
import GetArgs
import Algorythm

import System.Exit
import System.Environment
import System.Random

main :: IO ()
main = do
    -- let list = [[4, 5, 5], [44, 5, 5], [12, 8, 9]]
    -- let result = checkEachPixels list [33, 10, 8] (0, 0)
    -- print result
    -- print (getDistance [12, 8, 9] [33, 10, 8])
    -- let toto = map (map show) list
    -- print toto
    let list = ["-n", "-f", "-l"]
    args <- getArgs :: IO [String]
    gen <- newStdGen
    if (errorHandling args list) == False then exitWith (ExitFailure 84) else (startCompressor (getColorNumber args) (getConvergence args) (getFileName args) gen)

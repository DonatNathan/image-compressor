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

import System.Exit
import System.Environment
import System.Random

main :: IO ()
main = do
    let list = ["-n", "-f", "-l"]
    args <- getArgs :: IO [String]
    if (errorHandling args list) == False then exitWith (ExitFailure 84) else (startCompressor (getColorNumber args) (getConvergence args) (getFileName args))

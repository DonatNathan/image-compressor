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
import Utils

import System.Exit
import System.Environment
import System.Random

main :: IO ()
main = do
    -- let centroids = [[3, 4, 2], [12, 3, 3], [23, 56, 122]]
    -- let list = [[[3, 4, 2]], [[13, 14, 12], [112, 13, 13], [123, 156, 122]], [[13, 45, 45], [234, 234, 23]]]
    -- print (checkEachPixels centroids [13, 14, 12] (0, 0))
    -- print (checkEachPixels centroids [112, 13, 13] (0, 0))
    -- print (checkEachPixels centroids [123, 156, 122] (0, 0))
    -- let list2 = [[], [], []]

    -- let result = createEmptyList centroids
    -- let result = changeListPixels centroids list list2
    -- let result = setPixelInGoodList centroids list list2
    -- let result = addElementInList 0 [8, 8, 8, 8, 8] list2
    -- print result
    
    let list = ["-n", "-f", "-l"]
    args <- getArgs :: IO [String]
    gen <- newStdGen
    if (errorHandling args list) == False then exitWith (ExitFailure 84) else (startCompressor (getColorNumber args) (getConvergence args) (getFileName args) gen)

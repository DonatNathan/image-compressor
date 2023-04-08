--
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- Compressor
--

module Compressor where

import ErrorHandling
import Algorythm
import Display

import System.Exit
import System.Random

-- TODO Parse content
-- TODO End of Algo
-- TODO Display result
-- TODO Condition d'arrêt Algo

startCompressor :: Int -> Float -> String -> StdGen -> IO ()
startCompressor a b c gen = if (errorHandlingValues a b c) == False then exitWith(ExitFailure 84) else do
    content <- readFile c
    -- putStrLn content
    let centroids = randomizeCentroids a gen
    -- let result = loopAlgo centroids content
    putStrLn $ unwords $ map show centroids
    -- displayResult result

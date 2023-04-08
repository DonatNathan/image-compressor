--
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- Compressor
--

module Compressor where

import ErrorHandling
import Algorythm

import System.Exit
import System.Random

startCompressor :: Int -> Float -> String -> StdGen -> IO ()
startCompressor a b c gen = if (errorHandlingValues a b c) == False then exitWith(ExitFailure 84) else do
    content <- readFile c
    -- putStrLn content
    let centroides = randomizeCentroids a gen
    -- putStrLn $ unwords $ map show centroides

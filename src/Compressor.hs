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
import Utils

import System.Exit
import System.Random
import Data.List
import Data.Char

-- TODO End of Algo
-- TODO Display result
-- TODO Condition d'arrêt Algo

parseString :: String -> [Int]
parseString xs = case dropWhile (not . isDigit) xs of
                     "" -> []
                     ys -> let (n, rest) = span isDigit ys
                           in read n : parseString rest

readPixels :: [String] -> [[Int]]
readPixels [] = []
readPixels (x:xs) = parseString x : readPixels xs

addEmptyList :: [[Int]] -> Int -> [[[Int]]]
addEmptyList list 0 = [list]
addEmptyList list i = [] : addEmptyList list (i - 1)

startCompressor :: Int -> Float -> String -> StdGen -> IO ()
startCompressor a b c gen = if (errorHandlingValues a b c) == False then exitWith(ExitFailure 84) else do
    
    content <- readFile c
    let myLines = lines content
    let pixels_temp = readPixels myLines
    let pixels = reverse (addEmptyList pixels_temp (a - 1))
    let centroids = randomizeCentroids a gen
    let result = loopAlgo centroids pixels b
    displayResult result

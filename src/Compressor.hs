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
import Control.Monad

import System.Exit
import System.Random
import Data.List
import Data.Char

-- parseString :: String -> [Int]
-- parseString xs = case dropWhile (not . isDigit) xs of
--                      "" -> []
--                      ys -> let (n, rest) = span isDigit ys
--                            in read n : parseString rest

-- readPixels :: [String] -> [[Int]]
-- readPixels [] = []
-- readPixels (x:xs) = parseString x : readPixels xs

-- addEmptyList :: [[Int]] -> Int -> [[[Int]]]
-- addEmptyList list 0 = [list]
-- addEmptyList list i = [] : addEmptyList list (i - 1)

getRandomTuple :: IO Point
getRandomTuple = do
    [x, y, z] <- replicateM 3 (randomRIO (1, 255))
    return (x, y, z)

-- Get random centroids
randomizeCentroids :: Int -> IO CentroidList
randomizeCentroids i = sequence $ replicate i getRandomTuple

getPixels :: [String] -> Cluster
getPixels content = [] -- TODO

startCompressor :: Int -> Double -> String -> StdGen -> IO ()
startCompressor a b c gen = if (errorHandlingValues a b c) == False then exitWith(ExitFailure 84) else do
    
    content <- readFile c
    let myLines = lines content
    let pixels = getPixels myLines
    centroids <- randomizeCentroids a
    let result = myAlgo centroids pixels b
    displayResult result

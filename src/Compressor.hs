{-
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- Compressor
-}

module Compressor where

import ErrorHandling
import Algorythm
import Display

import Control.Monad
import System.Exit
import System.Random
import Data.List
import Data.Char

parseString :: String -> [Int]
parseString xs = case dropWhile (not . isDigit) xs of
                     "" -> []
                     ys -> let (n, rest) = span isDigit ys
                           in read n : parseString rest

readPixels :: [String] -> [[Int]]
readPixels [] = []
readPixels (x:xs) = parseString x : readPixels xs

fillPoint ::  [Int] -> Point
fillPoint (r:g:b) = (r,g,last b)

fillPixel :: [Int] -> Pixel
fillPixel (x:xs:xxs) = ((x, xs), fillPoint xxs)

fillCluster :: [[Int]] -> Cluster
fillCluster [] = []
fillCluster (x:xs) = fillPixel x : fillCluster xs

getRandomTuple :: IO Point
getRandomTuple = do
    [x, y, z] <- replicateM 3 (randomRIO (1, 255))
    return (x, y, z)

-- Get random centroids
randomizeCentroids :: Int -> IO CentroidList
randomizeCentroids i = sequence $ replicate i getRandomTuple

startCompressor :: Int -> Double -> String -> IO ()
startCompressor a b c = if (errorHandlingValues a b c) == False
    then exitWith(ExitFailure 84) else do
    content <- readFile c
    let myLines = lines content
    let cluster = readPixels myLines
    let pixels = fillCluster cluster
    centroids <- randomizeCentroids a
    let result = myAlgo centroids pixels b
    displayResult result

--
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- Algorythm
--

module Algorythm where

import Utils

import System.Random

chunksOf :: Int -> [Int] -> [[Int]]
chunksOf n [] = []
chunksOf n numbers = take n numbers : chunksOf n (drop n numbers)

randomizeCentroids :: Int -> StdGen -> [[Int]]
randomizeCentroids i gen = do
    let randomNumbers = take (i * 3) $ randomRs (1, 255) gen
    chunksOf 3 randomNumbers

checkConvergence :: [[Int]] -> [[[Int]]] -> Float -> Bool
checkConvergence centroids pixels l = True

changeListPixels :: [[Int]] -> [[[Int]]] -> [[[Int]]]
changeListPixels centroids pixels = pixels

addPixelsLists :: [[Int]] -> [Int]
addPixelsLists [] = []
addPixelsLists (x:end) | end == [] = x
addPixelsLists (x:end) = zipWith (+) x (addPixelsLists end)

-- Move centroids at center of his pixels
moveCentroids :: [[Int]] -> [[[Int]]] -> [[Int]]
moveCentroids [] [] = []
moveCentroids (x:centroids) (y:pixels) = do
    let result = (map (\i -> i `div` (length y)) (addPixelsLists y))
    (if result /= [] then tail(tail(result)) else result) : moveCentroids centroids pixels

loopAlgo :: [[Int]] -> [[[Int]]] -> Float -> ([[Int]], [[[Int]]])
loopAlgo centroids pixels convergence = do
    let newPixels = changeListPixels centroids pixels
    let newCentroids = (moveCentroids centroids pixels)
    if checkConvergence centroids pixels convergence then 
        (newCentroids, newPixels)
    else
        loopAlgo newCentroids newPixels convergence
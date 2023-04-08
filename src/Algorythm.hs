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

changeListPixels :: [[Int]] -> [[[Int]]] -> [[[Int]]]
changeListPixels centroids pixels = pixels

-- Move centroids at center of his pixels
moveCentroids :: [[Int]] -> [[[Int]]] -> [[Int]]
moveCentroids centroids pixels = centroids

loopAlgo :: [[Int]] -> [[[Int]]] -> Float -> ([[Int]], [[[Int]]])
loopAlgo centroids pixels convergence = (centroids, pixels)
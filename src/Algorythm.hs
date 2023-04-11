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

getDistance :: [Int] -> [Int] -> Float
getDistance x y = sqrt (fromIntegral (((getElement y 2) - (getElement x 2))^2 + ((getElement y 3) - (getElement x 3))^2 + ((getElement y 4) - (getElement x 4))^2) :: Float)

--DON'T FORGET THAT PIXELS ARE FIVE ELEMENTS

checkEachPixels :: [[Int]] -> [Int] -> (Int, Float) -> (Int, Float)
checkEachPixels [] (list) (x, y) = (0, -1)
checkEachPixels (f:centroids) (list) (x, y) = do
    let old = checkEachPixels centroids list ((x + 1), y)
    let result = getDistance f list
    if  result < (snd old) || (snd old) == -1 then (x, result) else old

-- Reassign pixels to centroids
changeListPixels :: [[Int]] -> [[[Int]]] -> [[[Int]]]
changeListPixels centroids [] = []
changeListPixels centroids (x:pixels) = x : changeListPixels centroids pixels

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
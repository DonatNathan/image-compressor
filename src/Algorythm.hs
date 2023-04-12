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

checkConvergence :: [[Int]] -> [[Int]] -> Float -> Bool
checkConvergence centroids pixels l = True
-- checkConvergence [] [] l = False
-- checkConvergence (f:centroids) (g:pixels) l = if (getDistance f g) <= l then True else (checkConvergence centroids pixels l)

getDistance :: [Int] -> [Int] -> Float
getDistance x y = sqrt (fromIntegral (((getElement y 2) - (getElement x 2))^2 + ((getElement y 3) - (getElement x 3))^2 + ((getElement y 4) - (getElement x 4))^2) :: Float)

checkEachPixels :: [[Int]] -> [Int] -> (Int, Float) -> (Int, Float)
checkEachPixels [] (list) (x, y) = (0, -1)
checkEachPixels (f:centroids) (list) (x, y) = do
    let old = checkEachPixels centroids list ((x + 1), y)
    let result = getDistance f list
    if  result < (snd old) || (snd old) == -1 then (x, result) else old

--DON'T FORGET THAT PIXELS ARE FIVE ELEMENTS
-- Reassign pixels to centroids

setPixelInGoodList :: [[Int]] -> [[Int]] -> [[[Int]]] -> [[[Int]]]
setPixelInGoodList (centroids) [] new = new
setPixelInGoodList centroids (x:pixels) new = setPixelInGoodList centroids pixels (addElementInList (fst (checkEachPixels centroids x (0, 0))) x new)

addElementInList :: Int -> [Int] -> [[[Int]]] -> [[[Int]]]
addElementInList rowIndex add lst =
    let updatedRow = (getElementList lst rowIndex) ++ [add]
    in take rowIndex lst ++ [updatedRow] ++ drop (rowIndex + 1) lst

changeListPixels :: [[Int]] -> [[[Int]]] -> [[[Int]]] -> [[[Int]]]
changeListPixels centroids [] new = new
changeListPixels centroids (x:pixels) new = changeListPixels centroids pixels (setPixelInGoodList centroids x new)

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

createEmptyList :: [[Int]] -> [[[Int]]]
createEmptyList [] = []
createEmptyList (f:centroids) = [[]] : createEmptyList centroids

loopAlgo :: [[Int]] -> [[[Int]]] -> Float -> ([[Int]], [[[Int]]])
loopAlgo centroids pixels convergence = do
    let newPixels = changeListPixels centroids pixels [[], [], []]
    let newCentroids = (moveCentroids centroids pixels)
    if checkConvergence centroids newCentroids convergence then 
        (newCentroids, newPixels)
    else
        loopAlgo newCentroids newPixels convergence
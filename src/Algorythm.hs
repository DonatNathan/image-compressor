--
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- Algorythm
--

module Algorythm where

import Utils

import System.Random

type Point = (Int, Int, Int)
type Pixel = ((Int, Int), Point)
type Cluster = [Pixel]
type CentroidList = [Point]


-- addPixelsLists :: [[Int]] -> [Int]
-- addPixelsLists [] = []
-- addPixelsLists (x:end) | end == [] = x
-- addPixelsLists (x:end) = zipWith (+) x (addPixelsLists end)

-- -- Move centroids at center of his pixels
-- moveCentroids :: [[Int]] -> [[[Int]]] -> [[Int]]
-- moveCentroids [] [] = []
-- moveCentroids (x:centroids) (y:pixels) = do
--     let result = (map (\i -> i `div` (length y)) (addPixelsLists y))
--     (if result /= [] then tail(tail(result)) else x) : moveCentroids centroids pixels


getClosestCentroid :: Pixel -> CentroidList -> Point
getClosestCentroid (_, point) centroids = do
    let distances = map (\centroid -> distancePoints point centroid) centroids
    let closestCentroid = head $ filter (\centroid -> distancePoints point centroid == (minimum distances)) centroids
    closestCentroid

-- Set points to a centroid
createNewClusters :: Cluster -> CentroidList -> [Cluster]
createNewClusters cluster centroids = map (\c -> filter (\pixel -> getClosestCentroid pixel centroids == c) cluster) centroids

-- Find centroid of a cluster
findCentroid :: Cluster -> Point
findCentroid cluster = do
    let len = fromIntegral $ length cluster
    let x = sum $ map (\(_, (x, _, _)) -> fromIntegral x) cluster
    let y = sum $ map (\(_, (_, y, _)) -> fromIntegral y) cluster
    let z = sum $ map (\(_, (_, _, z)) -> fromIntegral z) cluster
    (round $ x / len, round $ y / len, round $ z / len)

-- Find centroid for each clusters
findNewCentroids :: [Cluster] -> CentroidList
findNewCentroids clusters = map findCentroid clusters

-- Get distance between two points (used on setPointsToCentroid and stop loop)
distancePoints :: Point -> Point -> Double
distancePoints (x1, y1, z1) (x2, y2, z2) = sqrt ((fromIntegral x2 - fromIntegral x1)^2 + (fromIntegral y2 - fromIntegral y1)^2 + (fromIntegral z2 - fromIntegral z1)^2)

-- Test convergence
isConvergence :: CentroidList -> CentroidList -> Double -> Bool
isConvergence [] [] convergence = False
isConvergence (f:old) (g:new) convergence = if (distancePoints f g) <= convergence then True else (isConvergence old new convergence)

-- Loop
myAlgo :: CentroidList -> Cluster -> Double -> (CentroidList, [Cluster])
myAlgo centroids cluster convergence = do
    let newClusters = createNewClusters cluster centroids
    let newCentroids = findNewCentroids newClusters
    if (isConvergence centroids newCentroids convergence) then
        (newCentroids, newClusters)
    else
        myAlgo newCentroids cluster convergence

-- checkEachPixels :: [[Int]] -> [Int] -> (Int, Float) -> (Int, Float)
-- checkEachPixels [] (list) (x, y) = (0, -1)
-- checkEachPixels (f:centroids) (list) (x, y) = do
--     let old = checkEachPixels centroids list ((x + 1), y)
--     let result = getDistance f list
--     if  result < (snd old) || (snd old) == -1 then (x, result) else old

-- setPixelInGoodList :: [[Int]] -> [[Int]] -> [[[Int]]] -> [[[Int]]]
-- setPixelInGoodList (centroids) [] new = new
-- setPixelInGoodList centroids (x:pixels) new = setPixelInGoodList centroids pixels (addElementInList (fst (checkEachPixels centroids x (0, 0))) x new)

-- addElementInList :: Int -> [Int] -> [[[Int]]] -> [[[Int]]]
-- addElementInList rowIndex add lst =
--     let updatedRow = (getElementList lst rowIndex) ++ [add]
--     in take rowIndex lst ++ [updatedRow] ++ drop (rowIndex + 1) lst

-- changeListPixels :: [[Int]] -> [[[Int]]] -> [[[Int]]] -> [[[Int]]]
-- changeListPixels centroids [] new = new
-- changeListPixels centroids (x:pixels) new = changeListPixels centroids pixels (setPixelInGoodList centroids x new)

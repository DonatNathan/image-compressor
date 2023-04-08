--
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- Algorythm
--

module Algorythm where

import System.Random
import Data.List.Split

randomizeCentroids :: Int -> StdGen -> [[(Int, Int, Int)]]
randomizeCentroids 0 gen = []
randomizeCentroids i gen = do
    let randomNumbers = take (i * 3) $ randomRs (1, 255) gen
    let chunks = chunksOf 3 randomNumbers
        truple = map (\[x, y, z] -> (x, y, z)) chunks
    return truple

-- loopAlgo :: [(a,b,c)] -> [a] -> [a]
-- loopAlgo (centroides) (pixels) = 
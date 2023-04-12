--
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- Display
--

module Display where

import Utils

displayPixels :: [[Int]] -> IO ()
displayPixels [] = return ()
displayPixels (x:xs) = do
    putStr $ show (getElement x 0, getElement x 1)
    putStr " "
    putStrLn $ show (getElement x 2, getElement x 3, getElement x 4)
    displayPixels xs

displayResult :: ([[Int]], [[[Int]]]) -> IO ()
displayResult ([], pixels) = return ()
displayResult (centroids, pixels) = do
    putStrLn "--"
    putStrLn $ show (truple (head centroids))
    putStrLn "-"
    displayPixels (head pixels)
    displayResult (tail centroids, tail pixels)
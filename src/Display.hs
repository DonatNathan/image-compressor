{-
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- Display
-}

module Display where

import Utils
import Algorythm

displayPixel :: Pixel -> IO ()
displayPixel (pos, color) = putStrLn $ show pos ++ " " ++ show color

displayResult :: (CentroidList, [Cluster]) -> IO ()
displayResult ([], []) = return ()
displayResult (f:centroids, (g:clusters)) =
    putStrLn "--" >>
    print f >>
    putStrLn "-" >>
    mapM_ displayPixel g >>
    displayResult (centroids, clusters)

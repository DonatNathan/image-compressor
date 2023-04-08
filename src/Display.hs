--
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- Display
--

module Display where

displayResult :: ([[(Int, Int, Int)]], [[(Int, Int, Int)]]) -> IO ()
displayResult (centroids, pixels) = do
    putStrLn $ unwords $ map show centroids
    putStrLn $ unwords $ map show pixels
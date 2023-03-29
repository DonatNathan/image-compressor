--
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- GetArgs
--

module GetArgs where

getColorNumber :: [String] -> Int
getColorNumber [] = -1
getColorNumber (i:j:args) = if i == "-n" then read j :: Int else getColorNumber args

getConvergence :: [String] -> Float
getConvergence [] = -1
getConvergence (i:j:args) = if i == "-l" then read j :: Float else getConvergence args

getFileName :: [String] -> String
getFileName [] = "error"
getFileName (i:j:args) = if i == "-f" then j else getFileName args
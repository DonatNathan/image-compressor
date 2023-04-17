{-
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- GetArgs
-}

module GetArgs where

getColor :: [String] -> Int
getColor [] = -1
getColor (i:j:args) =
    if i == "-n" then read j :: Int else getColor args

getConv :: [String] -> Double
getConv [] = -1
getConv (i:j:args) =
    if i == "-l" then read j :: Double else getConv args

getFileName :: [String] -> String
getFileName [] = "error"
getFileName (i:j:args) = if i == "-f" then j else getFileName args

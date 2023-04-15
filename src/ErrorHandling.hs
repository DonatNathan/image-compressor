{-
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- ErrorHandling
-}

module ErrorHandling where

import Utils

import System.Environment

errHandColorNumber :: Int -> Bool
errHandColorNumber a = if a < 1 then False else True

errHandConvergence :: Double -> Bool
errHandConvergence b = if b < 0 then False else True

errHandFileName :: String -> Bool
errHandFileName c = if c == "error" then False else True

errorHandlingValues :: Int -> Double -> String -> Bool
errorHandlingValues a b c =
    (errHandColorNumber a) && (errHandConvergence b) && (errHandFileName c)

errorHandling :: [String] -> [String] -> Bool
errorHandling [] (list) = True
errorHandling (i:[]) (list) = False
errorHandling (i:j:args) (list) | i /= "-f" =
    if isNumber j then errorHandling args list else False
errorHandling (i:j:args) (list) =
    if (i `elem` list) then errorHandling args list else False

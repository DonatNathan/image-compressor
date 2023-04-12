--
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- ErrorHandling
--

module ErrorHandling where

import Utils

import System.Environment

errorHandlingColorNumber :: Int -> Bool
errorHandlingColorNumber a = if a < 1 then False else True

errorHandlingConvergence :: Float -> Bool
errorHandlingConvergence b = if b < 0 then False else True

errorHandlingFileName :: String -> Bool
errorHandlingFileName c = if c == "error" then False else True

errorHandlingValues :: Int -> Float -> String -> Bool
errorHandlingValues a b c = (errorHandlingColorNumber a) && (errorHandlingConvergence b) && (errorHandlingFileName c)

errorHandling :: [String] -> [String] -> Bool
errorHandling [] (list) = True
errorHandling (i:args) (list) | args == [] = False
errorHandling (i:j:args) (list) | i /= "-f" = if isNumber j then errorHandling args list else False
errorHandling (i:j:args) (list) = if (i `elem` list) then errorHandling args list else False

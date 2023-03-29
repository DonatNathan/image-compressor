--
-- EPITECH PROJECT, 2023
-- B-FUN-400-LYN-4-1-compressor-nathan.donat-filliod
-- File description:
-- Utils
--

module Utils where

isNumber :: [Char] -> Bool
isNumber [] = True
isNumber (i:str) =
    if (i > '9' || i < '0') && i /= '-' && i /= '.' then False else isNumber str
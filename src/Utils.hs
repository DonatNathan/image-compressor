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

getElement :: [Int] -> Int -> Int
getElement (x:xs) 0 = x
getElement (x:xs) i = getElement xs (i - 1)

truple :: [Int] -> (Int, Int, Int)
truple list = (getElement list 0, getElement list 1, getElement list 2)
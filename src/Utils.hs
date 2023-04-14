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

-- getElement :: [Int] -> Int -> Int
-- getElement [] i = 0
-- getElement (x:xs) 0 = x
-- getElement (x:xs) i = getElement xs (i - 1)

-- getElementList :: [[[Int]]] -> Int -> [[Int]]
-- getElementList [] i = []
-- getElementList (x:list) 0 = x
-- getElementList (x:xs) i = getElementList xs (i - 1)

-- truple :: [Int] -> (Int, Int, Int)
-- truple list = (getElement list 0, getElement list 1, getElement list 2)

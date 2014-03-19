module Cis194.Hw.Golf where

skipsOne :: Int -> [a] -> [a]
skipsOne _ [] = []
skipsOne n (x:xs) = [x] ++ skipsOne n (drop n xs)

skips :: [a] -> [[a]]
skips [] = []
skips xs = map (\n -> skipsOne n $ drop n xs) [0..((length xs) - 1)]

localMaxima :: [Integer] -> [Integer]
localMaxima (x:y:z:xs) = if y > x && y > z then y : (localMaxima (y:(z:xs))) else localMaxima (y:(z:xs))
localMaxima _ = []

histLineStr :: [Bool] -> String
histLineStr xs = map (\b -> if b then '*' else ' ') xs

freq :: Integer -> [Integer] -> Int
freq x xs = length $ filter (\y -> x == y) xs

toHistLine :: Int -> [Int] -> [Bool]
toHistLine n freqs = map (\f -> f >= n) freqs

histogram :: [Integer] -> String
histogram xs = (unlines (map histLineStr hlines)) ++ "==========\n0123456789\n"
  where fr = map (\n -> freq n xs) [0..9]
        maxFreq = maximum fr
        hlines = map (\x -> toHistLine x fr) (reverse [1..maxFreq])

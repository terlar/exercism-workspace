module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n | n <= 0     = Nothing
          | otherwise = Just $ collatz' 0 n

collatz' :: Integer -> Integer -> Integer
collatz' len 1 = len
collatz' len n = collatz' (len + 1) (collatzNext n)

collatzNext :: Integer -> Integer
collatzNext n | 1 == n     = 1
              | even n    = n `quot` 2
              | otherwise = 3 * n + 1

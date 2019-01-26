module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n | n <= 0     = Nothing
          | otherwise = Just $ collatzLength n

collatzLength :: Integer -> Integer
collatzLength n = fromIntegral . length
                  $ takeWhile (/= 1)
                  $ iterate collatzNext n

collatzNext :: Integer -> Integer
collatzNext n | 1 == n     = 1
              | even n    = n `quot` 2
              | otherwise = 3 * n + 1

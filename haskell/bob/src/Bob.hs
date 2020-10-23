module Bob (responseFor) where
import           Data.Char (isAlpha, isSpace, isUpper)
import           Data.List (dropWhileEnd, isSuffixOf)

responseFor :: String -> String
responseFor input | all ($ input) [isShouting, isAsking] = "Calm down, I know what I'm doing!"
                  | isShouting input = "Whoa, chill out!"
                  | isAsking input = "Sure."
                  | isSilent input = "Fine. Be that way!"
                  | otherwise = "Whatever."

isAsking :: String -> Bool
isAsking input = "?" `isSuffixOf` (dropWhileEnd isSpace input)

isShouting :: String -> Bool
isShouting input | not (any isAlpha input) = False
                 | otherwise = all isUpper $ filter isAlpha input

isSilent :: String -> Bool
isSilent = all isSpace
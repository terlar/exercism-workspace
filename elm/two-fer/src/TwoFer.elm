module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer name =
    let
        target =
            Maybe.withDefault "you" name
    in
    "One for " ++ target ++ ", one for me."

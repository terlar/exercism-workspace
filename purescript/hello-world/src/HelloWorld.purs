module HelloWorld where

import Prelude ((<>))
import Data.Maybe (Maybe(Just, Nothing))

helloWorld :: Maybe String -> String
helloWorld Nothing = helloWorld (Just "World")
helloWorld (Just name) = "Hello, " <> name <> "!"

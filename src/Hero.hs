module Hero (
    Hero (..)
) where

import Object (Object)
import Kinetic (Kinetic, advance)
import Reactive (Reactive, react)

data Hero
    = Hero {
        object :: Object
    }
    deriving (Eq, Show, Read)

instance Kinetic Hero where
    advance t (Hero o) = Hero (advance t o)

instance Reactive Hero where
    hero `react` _ = Nothing

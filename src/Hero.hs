module Hero (
    Hero (..)
) where

import Object (Object)
import Kinetic (Kinetic, advance)
import Reactive (Reacive, interact)

data Hero
    = Hero {
        object :: Object
    }
    deriving (Eq, Show, Read)

instance Kinetic Hero where
    advance (Hero object) = Hero (advance object)

instance Reactive Hero where
    hero `interact` o = ???

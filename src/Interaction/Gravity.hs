module Interaction.Gravity (
    Massive,
    GravitationalAttraction (..)
) where

import Number (Number)
import Object (Object (..))
import Interaction (Reaction (..))
import Physics (inverseSquare)

class (Object a) => Massive a

data GravitationalAttraction
    = GravitationalAttraction Number
    deriving (Eq, Show)

instance Reaction GravitationalAttraction where
    react o1 o2 (GravitationalAttraction g) =
        let f = inverseSquare g (position o1, mass o1) (position o2, mass o2)
        in (o1, o2) -- TODO: apply force

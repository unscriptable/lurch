{-# LANGUAGE MultiParamTypeClasses #-}
module BlockOfStone (
    BlockOfStone (..)
) where

import Geometry (Point, Vector (..))
import Object (Object (..))
import Number (Number)

data BlockOfStone
    = BlockOfStone {
        bLocation :: Point,
        bMass :: Number -- not sure if this might be needed by other objects
    }
    deriving (Eq, Show, Read)

instance Object BlockOfStone where
    position      = bLocation
    mass          = bMass
    velocity _    = Vector 0.0 0.0 0.0 -- immobile
    tick _ block  = block -- immobile
    impel _ block = block -- impervious

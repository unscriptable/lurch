{-# LANGUAGE MultiParamTypeClasses #-}
module Object (
    Mass,
    Velocity,
    Object (..)
) where

import Number
import Geometry
-- import Shape

type Mass = Number
type Velocity = Coords Number

data Object
    = Object {
        position :: Point,
        -- shape :: Shape,
        velocity :: Velocity,
        mass :: Mass
    }
    deriving (Show, Read)

instance Kinetic Object where
    advance time (Object pos vel mass) = Object (updatePos time vel pos) vel mass

-- Updates a set of coordinates based off a velocity and elapsed time.
updatePos :: NominalDiffTime -> Velocity -> Point -> Point
updatePos _ (Coords 0 0 0)     point         = point
updatePos t (Coords dx dy dz) (Coords x y z) =
    let seconds = realToFrac t
    in Coords (x + dx * seconds) (y + dy * seconds) (z + dz * seconds)

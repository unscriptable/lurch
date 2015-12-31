{-# LANGUAGE MultiParamTypeClasses #-}
module Object (
    Mass,
    Velocity,
    Object (..)
) where

import Number (Number)
import Geometry (Coords (..), Point)
-- import Shape
import Kinetic (Kinetic, ElapsedTime, advance)

type Mass = Number
type Velocity = Coords Number

data Object
    = Object {
        position :: Point,
        -- shape :: Shape,
        velocity :: Velocity,
        mass :: Mass
    }
    deriving (Eq, Show, Read)

instance Kinetic Object where
    advance time (Object pos vel m) = Object (updatePos time vel pos) vel m

-- Updates a set of coordinates based off a velocity and elapsed time.
updatePos :: ElapsedTime -> Velocity -> Point -> Point
updatePos _ (Coords 0 0 0)     point         = point
updatePos t (Coords dx dy dz) (Coords x y z) =
    let seconds = realToFrac t
    in Coords (x + dx * seconds) (y + dy * seconds) (z + dz * seconds)

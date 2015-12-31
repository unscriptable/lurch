module Geometry (
    Point,
    Distance,
    Slope,
    Line (..),
    Coords (..)
) where

import Number

type Point = Coords Number
type Distance = Coords Number
type Slope = Coords Number

data Line
    = PointSlope {
        point :: Point,
        slope :: Slope
    }
    | PointPoint {
        p1, p2 :: Point
    }
    deriving (Eq, Show, Read)

data Coords a
    = Coords a a a
    deriving (Eq, Show, Read)

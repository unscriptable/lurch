module Geometry (
    Point,
    Distance,
    Slope,
    ElapsedTime,
    Force,
    Momentum,
    Mass,
    Velocity,
    Line (..),
    Vector (..),
    (|*), (*|),
    (|/), (/|),
    (|*|), (|.|),
    scaleV,
    distance,
    crossProduct,
    scalarProduct,
    magnitude
) where

import Number
import Data.Time.Clock (NominalDiffTime)

type Point = Vector Number
type Distance = Vector Number
type Slope = Vector Number
type ElapsedTime = NominalDiffTime
type Force = Vector Number
type Momentum = Vector Number
type Mass = Number
type Velocity = Vector Number

data Line
    = PointSlope {
        point :: Point,
        slope :: Slope
    }
    | PointPoint {
        p1, p2 :: Point
    }
    deriving (Eq, Show, Read)

data Vector a
    = Vector a a a
    deriving (Eq, Show, Read)

instance Num a => Num (Vector a) where
    (Vector x1 y1 z1) + (Vector x2 y2 z2) = Vector (x1 + x2) (y1 + y2) (z1 + z2)
    (Vector x1 y1 z1) - (Vector x2 y2 z2) = Vector (x1 - x2) (y1 - y2) (z1 - z2)
    (Vector x1 y1 z1) * (Vector x2 y2 z2) =
        Vector (y1 * z2 - z1 * y2) (z1 * x2 - x1 * z2) (x1 * y2 - y1 * x2)
    negate (Vector x y z) =
        Vector (negate x) (negate y) (negate z)
    abs (Vector x y z) =
        Vector (abs x) (abs y) (abs z)
    signum (Vector x y z) =
        Vector (signum x) (signum y) (signum z)
    fromInteger x =
        let int = fromInteger x
        in Vector int int int

(|*) :: Vector Number -> Number -> Vector Number
(|*) (Vector x y z) c = Vector (x * c) (y * c) (z * c)

infixl 7 |*

(*|) :: Number -> Vector Number -> Vector Number
(*|) c v = v |* c

infixl 7 *|

(|/) :: Vector Number -> Number -> Vector Number
(|/) (Vector x y z) c = Vector (x / c) (y / c) (z / c)

infixl 7 |/

(/|) :: Number -> Vector Number -> Vector Number
(/|) c (Vector x y z) = Vector (c / x) (c / y) (c / z)

infixl 7 /|

scaleV :: Vector Number -> Number -> Vector Number
scaleV = (|*)

distance :: Point -> Point -> Number
distance (Vector x1 y1 z1) (Vector x2 y2 z2) =
    let dx = (x2 - x1)
        dy = (y2 - y1)
        dz = (z2 - z1)
    in  sqrt $ dx * dx + dy * dy + dz * dz

magnitude :: Vector Number -> Number
magnitude = distance (Vector 0 0 0)

(|*|) :: Vector Number -> Vector Number -> Vector Number
(|*|)  (Vector x1 y1 z1) (Vector x2 y2 z2) =
    Vector (y1 * z2 - y2 * z1) (x1 * z2 - x2 * z1) (x1 * y2 - x2 * y1)

infix 7 |*|

crossProduct :: Vector Number -> Vector Number -> Vector Number
crossProduct = (|*|)

(|.|) :: Vector Number -> Vector Number -> Number
(|.|) (Vector x1 y1 z1) (Vector x2 y2 z2) =
    (x1 * x2) + (y1 * y2) + (z1 * z2)

infix 7 |.|

scalarProduct :: Vector Number -> Vector Number -> Number
scalarProduct = (|.|)

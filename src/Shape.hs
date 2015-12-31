module Shape (
    Length,
    -- Width,
    Shape (..)
) where

import Number
-- import Geometry

type Length = Number
-- type Width = Number

-- A convex shape.
data Shape
    = Circle Length
    -- | Square Length
    -- | Rectangle Length Width
    deriving (Eq, Show, Read)

-- -- Distance to the edge of a shape from its origin in a specific direction.
-- extentInDirection :: Shape -> Slope -> Distance
-- extentInDirection (Circle r) (Coords dx dy dz) =
--     -- TODO
--
-- -- Returns true if the point is inside the extent of the shape.
-- isWithinExtent :: Shape -> Point -> Bool
-- isWithinExtent (Circle r) (Coords x y z) =
--     -- TODO

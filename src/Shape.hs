module Shape (
    Length,
    -- Width,
    -- Height,
    -- Depth,
    Shape (..)
) where

import Number
-- import Geometry

type Length = Number
-- type Width = Number
-- type Height = Number
-- type Depth = Number

-- A convex shape.
data Shape
    = Dot
    | Sphere Length
    -- | Cube Length
    -- | RectangularPrism Width Height Depth
    deriving (Eq, Show, Read)

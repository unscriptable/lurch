module Physics (
    inverseSquare
) where

import Number
import Geometry

-- The inverse square law can be used for Newton's Law of gravity,
-- Coulomb's Law of electrical attraction, etc.
-- let gravity = inverseSquare g (position o1, mass o1) (position o2, mass o2)
inverseSquare :: Number -> (Point, Number) -> (Point, Number) -> Vector Number
inverseSquare coeff (pos1, size1) (pos2, size2) =
    let dist = pos1 - pos2
        scalarDist = magnitude dist
    in coeff * size1 * size2 / (scalarDist * scalarDist * scalarDist) *| dist

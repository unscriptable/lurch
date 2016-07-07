module Object (
    Object (..),
    Solid (..),
    Massive (..)
) where

import Number (Number)
import Geometry (
    Point, Velocity, ElapsedTime, Momentum,
    (*|)
    )

-- TODO: consider deleting Object and putting its functions in Object

class Object a where
    position :: a -> Point
    -- TODO: add Shape
    mass :: a -> Number
    velocity :: a -> Velocity
    momentum :: a -> Momentum
    momentum o = mass o *| velocity o
    tick :: ElapsedTime -> a -> a
    impel :: Momentum -> a -> a
    -- push :: ElapsedTime -> Force -> a -> a

-- instance Object XYZ where
--     move time (Object pos m vel) =
--         let dPos = vel |* (realToFrac time)
--         in Object (pos + dPos) m vel
--     push time force (Object pos m vel) =
--         let dVel = force |* ((realToFrac time) / m) -- dv = dt * F / m
--         in Object pos m (vel + dVel)
--     impel p (Object pos m vel) = Object pos m (vel + p |/ m)

-- TODO: move these to a new file or files

class Object a => Solid a where
    deflect :: a -> a -> (a, a) -- perfect elastic collision
    attach :: a -> a -> (a, a) -- perfect inelastic collision

-- instance Solid XYZ where
--     deflect o1 o2 =
--         -- m1v1 + m2v2 = m1'v1' + m2'v2'
--         -- r=d−2(d⋅n̂)n̂ where n̂ = normalized perpendicular
--         -- perpendicular = a |*| b
--         let (p1, p2) = (momentum o1, momentum o2)
--             pTotal = p1 + p2
--             pPerp1 = pTotal |*| p1
--             pNorm1 = pPerp1 |/ magnitude pPerp1
--             pDeflect1 = p1 - 2.0 *| ((p1 |.| pNorm1) *| pNorm1)
--             pPerp2 = pTotal |*| p2
--             pNorm2 = pPerp2 |/ magnitude pPerp2
--             pDeflect2 = p2 - 2.0 *| ((p2 |.| pNorm2) *| pNorm2)
--         -- TODO: is this correct?
--         in (impel pDeflect1 o1, impel pDeflect2 o2)
--     attach o1 o2 =
--         let (p1, p2) = (momentum o1, momentum o2)
--             pTotal = p1 + p2
--         -- TODO: this isn't correct:
--         in (impel pTotal o1, impel pTotal o2)

class Massive a

-- TODO: electromagnetic interaction, too

-- instance Gravitational Massive where
--     attract time (Massive (Object pos1 m1 vel1) gravConst) o2@(Object pos2 m2 vel2) =
--         let r = pos1 - pos2
--             -- F = G * (m1 * m2) / (r ^ 2)
--             -- F = m1 * a = m1 * dv / dt = (m1 * dv) / dt = dp1 / dt
--             -- dp1 = dt * G * (m1 * m2) / (r ^ 2)
--             deltaP = (realToFrac time) * gravConst * (m1 * m2) /| (r |*| r)
--         in impel deltaP o2
{-
dp = m * dv
-}

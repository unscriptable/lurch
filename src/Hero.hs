{-# LANGUAGE MultiParamTypeClasses #-}
module Hero (
    Hero (..)
) where

import Object (Object (..))
import Interaction (Interaction (..), Reaction (..))
import Geometry (Point, Velocity, (|*), (|/))
import Number (Number)

-- The physics of a Hero.
data Hero
    = Hero {
        hLocation :: Point,
        hVelocity :: Velocity,
        hMass     :: Number
    }
    deriving (Eq, Show, Read)

-- Heroes are Objects.
instance Object Hero where
    position = hLocation
    mass     = hMass
    velocity = hVelocity
    tick time (Hero l v m) = Hero (l + v |* (realToFrac time)) v m
    impel p (Hero l v m) = Hero l (v + p |/ m) m

-- Heroes never interact.
instance Interaction Hero Hero () where
    interaction _ _ = Nothing

module Interaction.Collisions (
    ElasticCollision (..),
    InelasticCollision (..)
) where

import Number
import Interaction (Reaction (..))
import Geometry (Point, Vector (..))

-- The data required for a perfectly elastic colission between two objects.
data ElasticCollision
    = ElasticCollision Point
    deriving (Eq, Show)

-- The data required for an inelastic colission between two objects.
data InelasticCollision
    = SimpleInelasticCollision Point Number
    | VectorInelasticCollision Point (Vector Number)
    deriving (Eq, Show)

instance Reaction ElasticCollision where
    -- TODO: put formula in a physics module
    react o1 o2 _ = (o1, o2) -- TODO

instance Reaction InelasticCollision where
    -- TODO: put formula in a physics module
    react o1 o2 _ = (o1, o2) -- TODO

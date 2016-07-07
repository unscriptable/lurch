{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
-- Interactions between various game objects are described herein.
module Game.Interactions where

import Number (Number)
import Object (Object)
import Interaction (Interaction (..))
import Hero (Hero)
import BlockOfStone (BlockOfStone)
import Interaction.Collisions (InelasticCollision (..))
import Interaction.Gravity (Massive (..), GravitationalAttraction (..))
import Geometry (Vector (..))

-- Gravitational constant = 6.674×10^−11 N⋅m^2/kg^2
gravitationalConstant :: Number
gravitationalConstant = 6.674 * 10 ** (-11)

-- hmmmm.... we can't use run-time information to decide which type of reaction
instance Interaction Hero BlockOfStone InelasticCollision where
    interaction hero block = Just (SimpleInelasticCollision pos coeff)
        where
            pos = Vector 0 0 0 -- TODO
            coeff = 3.0 -- TODO
-- ICK:
instance Interaction BlockOfStone Hero InelasticCollision where
    interaction block hero = interaction hero block

-- Gravity 

instance (Massive a, Object b) => Interaction a b GravitationalAttraction where
    interaction a b = Just (GravitationalAttraction gravitationalConstant)

instance (Object b, Massive a) => Interaction a b GravitationalAttraction where
    interaction a b = interaction b a

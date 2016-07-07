{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies #-}
module Interaction (
    Reaction (..),
    Interaction (..)
) where

import Object (Object)

-- TODO: figure out how to enforce that the only things that can change are
-- velocity and mass (momentum).

-- Computes the outcomes when two objects react.
-- Parameter `c` encompasses the data required.
class Reaction c where
    react :: (Object a, Object b) => a -> b -> c -> (a, b)

-- Determines whether two object interact and what the reaction will be.
-- By default, objects don't interact.
class (Object a, Object b, Reaction c) => Interaction a b c | a b -> c where
    interaction :: a -> b -> Maybe c
    interaction _ _ = Nothing

-- Null reaction.
instance Reaction () where
    react a b _ = (a, b)

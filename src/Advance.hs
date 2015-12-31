module Advance (
    advanceAll,
    interactions
) where

import Kinetic (Kinetic, advance)
import Data.Time.Clock (NominalDiffTime)
import Reactive (Reactive, react)
import Reaction (Reaction)

-- Updates the position of each sprite based off the elapsed time since
-- the last update.
advanceAll :: Kinetic a => NominalDiffTime -> [a] -> [a]
advanceAll t = map (advance t)

-- Collects all the interactions from a list of objects.
-- TODO: consider a set instead of a list to prevent duplicates.
interactions :: Reactive a => [a] -> [Reaction]
interactions []           = []
interactions (obj : list) = interactions' obj list ++ interactions list

-- Collects all the interactions between a sprite and a list of sprites.
interactions' :: Reactive a => a -> [a] -> [Reaction]
interactions' o1 objects = foldr check [] objects
    where check o2 reactions = case o1 `react` o2 of
            Nothing -> reactions
            -- TODO: figure out what to do with reactions and reactives!
            Just (o1', o2', reaction) -> (reaction : reactions)

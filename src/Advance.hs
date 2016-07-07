module Advance (
    advanceAll,
    interactAll
) where

import Object (Object (tick))
import Data.Time.Clock (NominalDiffTime)
import Interaction (Interaction (interaction), Reaction (react))

-- Advances the time for each object.
advanceAll :: Object a => NominalDiffTime -> [a] -> [a]
advanceAll t = map (tick t)

-- Interacts all objects, generating a new list of objects.
interactAll :: Object a => [a] -> [a]
interactAll [] = []
interactAll [o1] = [o1]
interactAll (o1 : o2 : list) =
    case o1 `react` o2 of
        Nothing         -> interactAll (o1 : list) ++ interactAll (o2 : list)
        Just (o1', o2') -> interactAll (o1' : list) ++ interactAll (o2' : list)

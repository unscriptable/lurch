module Reactive (
    Reactive (..)
) where

import Reaction (Reaction)

class Reactive a where
    react :: a -> a -> Maybe (a, a, Reaction)

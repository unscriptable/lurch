module Reactive (
    Reactive (..)
) where

import Reaction (Reaction)

class Reactive a where
    interact :: a -> a -> Maybe (a, a, Reaction)

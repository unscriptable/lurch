module Reaction (
    Reaction
) where

import Reactive (Reactive)

data Reactive a => Reaction
    = Reaction a a

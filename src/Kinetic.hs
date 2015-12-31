module Kinetic (
    Kinetic (..)
) where

import Data.Time.Clock (NominalDiffTime)

class Kinetic a where
    advance :: NominalDiffTime -> a -> a

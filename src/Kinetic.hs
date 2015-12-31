module Kinetic (
    Kinetic (..),
    ElapsedTime
) where

import Data.Time.Clock (NominalDiffTime)

type ElapsedTime = NominalDiffTime

class Kinetic a where
    advance :: ElapsedTime -> a -> a

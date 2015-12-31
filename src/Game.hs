module Game (

) where

data Game
    = Game {
        running :: Bool
    }
    deriving (Eq, Show, Read)

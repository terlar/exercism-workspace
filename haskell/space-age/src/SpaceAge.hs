module SpaceAge
  ( Planet(..)
  , ageOn
  )
where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds / yearSeconds planet

yearSeconds :: Planet -> Float
yearSeconds Earth  = 31557600
yearSeconds planet = yearSeconds Earth * orbitalPeriodOn planet

orbitalPeriodOn :: Planet -> Float
orbitalPeriodOn Mercury = 0.2408467
orbitalPeriodOn Venus   = 0.61519726
orbitalPeriodOn Earth   = 1
orbitalPeriodOn Mars    = 1.8808158
orbitalPeriodOn Jupiter = 11.862615
orbitalPeriodOn Saturn  = 29.447498
orbitalPeriodOn Uranus  = 84.016846
orbitalPeriodOn Neptune = 164.79132

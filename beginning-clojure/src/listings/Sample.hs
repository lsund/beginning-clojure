
-- start snippet type-driven-development

-- I fill these in succesively, testing them with the repl.
mkPoint :: Double -> Double -> Point
mkPoint = undefined

euclideanDistance :: Point -> Point -> Double
euclideanDistance = undefined

-- end snippet type-driven-development

-- start snippet unsafe-records

-- The record is like a row-type in haskell that rich hickey wants

data Point = Point2D { x :: Double, y :: Double }
           | Point3D { x :: Double, y :: Double , z :: Double}

-- It does not have positional semantics. But if you have different fields
-- In different data constructors for the same type, you can loose static
-- Type safety.

-- Haskell
multiplyPoint :: Point -> Double -> Point
multiplyPoint p2@Point2d{} = (x p) * (z p)

-- The above passes the type checker but gives a runtime error.

-- end snippet unsafe-records

-- start snippet safe-records

-- In purescript, the Point-type has a different meaning.
-- It means that Point2D and Point3D both take just one argument,
-- a record. The record themselves have different types

-- Purescript
multiplyPoint :: Point -> Double -> Point
multiplyPoint p2@Point2d{} = (p.x) * (p.z)

-- Above is compile time error

-- end snippet safe-records

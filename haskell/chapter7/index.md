# Chapter 7 - Making Types and Typeclasses
[⬅︎ Back to Homepage](../../index.md)

## Types
### Intro
- Keyword `data` is used to define new types
```haskell
data [type_name] = [value_constructor]
```

- `type_name` and the `value_constructor` have to be capital cased
- everything before the the `=` is known as the **type constructor** & everything after is known as the **value constructor**
- functions acting on a type take the type constructor in the type decleration
- functions use the value constructor for pattern matching on the given arguments
- example of `Bool` type decleration
```haskell
data Bool = False | True
```

- when we write a value constructor, we can optionally add some types after it and those types define the values it will contain
- example of creating data types for shapes
```haskell
data Shape = Circle Float Float Float | Rectangle Float Float Float Float
```


#### Writing functions for these types
```haskell
surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)
```

- Uses pattern matching for value constructor
```haskell
nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))
```

### Exporting Data Types
```haskell
module Shapes
( Point(..)
, Shape(..)
, surface
, nudge
, baseCircle
, baseRect
) where
```
- `Shape(..)` exports all the value constructors for `Shape`
  -  It's the same as writing Shape (Rectangle, Circle)
- Opt not to export any value constructors for `Shape` by just writing `Shape` in the export statement

### Record Syntax
- Used to create value accessor methods for custom data types
- Example without record syntax
```haskell
-- Type Declaration
data Person = Person String String Int Float String String deriving (Show)
-- Function Definitions
firstName :: Person -> String
firstName (Person firstname _ _ _ _ _) = firstname
--
lastName :: Person -> String
lastName (Person _ lastname _ _ _ _) = lastname
--
age :: Person -> Int
age (Person _ _ age _ _ _) = age
--
height :: Person -> Float
height (Person _ _ _ height _ _) = height
--
phoneNumber :: Person -> String
phoneNumber (Person _ _ _ _ number _) = number
--
flavor :: Person -> String
flavor (Person _ _ _ _ _ flavor) = flavor
```

- Example with record syntax
```haskell
data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String
                     } deriving (Show)
```

### Type Parameters
- **type constructors** can take types as parameters to produce new types
```haskell
data Maybe a = Nothing | Just a
```

- `a` is the type parameter here
- example of using the `Maybe` type constructor
```haskell
ghci> Just "Haha"
Just "Haha"
ghci> Just 84
Just 84
ghci> :t Just "Haha"
Just "Haha" :: Maybe [Char]
ghci> :t Just 84
Just 84 :: (Num t) => Maybe t
ghci> :t Nothing
Nothing :: Maybe a
ghci> Just 10 :: Maybe Double
Just 10.0
```

- type constraints can be added to data type declerations (**not recommended**)
```haskell
data (Ord k) => Map k v = ...
```

## Typeclasses
### Making a Type an Instance of a Typeclass
- We can do this automatically using the `derive` keyword
```haskell
data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Eq, Show)
```

- In this example, in order to derive the `Eq` and `Show` typeclass, every field contained in the `Person` data type (meaning `String` and `Int`) must be part of the `Eq` and `Show` typeclasses already


# Chapter 7 - Making Types and Typeclasses
[⬅︎ Back to Homepage](../../index.md)

## Types
### Intro
- Keyword `data` is used to define new types
```haskell
data [type_name] = [value_constructor]
```

- `type_name` and the `value_constructor` have to be capital cased
- Everything before the the `=` is known as the **type constructor** & everything after is known as the **value constructor**
- Functions acting on a type take the type constructor in the type decleration
- Functions use the value constructor for pattern matching on the given arguments
- Example of `Bool` type decleration
```haskell
data Bool = False | True
```

- When we write a value constructor, we can optionally add some types after it and those types define the values it will contain
- Example of creating data types for shapes
```haskell
data Shape = Circle Float Float Float | Rectangle Float Float Float Float
```


#### Writing functions for these types
- Example
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
- Example
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
- **Type constructors** can take types as parameters to produce new types
```haskell
data Maybe a = Nothing | Just a
```

- `a` is the type parameter here
- Example of using the `Maybe` type constructor
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

- Type constraints can be added to data type declerations (**not recommended**)
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

- We can build a class to represent days quite simply
```haskell
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
           deriving (Eq, Ord, Show, Read, Bounded, Enum)
```

- Because it's part of the `Show` and `Read` typeclasses, we can convert values of this type to and from strings.
```haskell
ghci> Wednesday
Wednesday
ghci> show Wednesday
"Wednesday"
ghci> read "Saturday" :: Day
Saturday
```

- Because it's part of the `Eq` and `Ord` typeclasses, we can compare or equate days.
```haskell
ghci> Saturday == Sunday
False
ghci> Saturday == Saturday
True
ghci> Saturday > Friday
True
ghci> Monday `compare` Wednesday
LT
```

- It's also part of `Bounded`, so we can get the lowest and highest day.
```haskell
ghci> minBound :: Day
Monday
ghci> maxBound :: Day
Sunday
```

- It's also an instance of `Enum`. We can get predecessors and successors of days and we can make list ranges from them!
```haskell
ghci> succ Monday
Tuesday
ghci> pred Saturday
Friday
ghci> [Thursday .. Sunday]
[Thursday,Friday,Saturday,Sunday]
ghci> [minBound .. maxBound] :: [Day]
[Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday]
```

### Type Synonyms
- Allows us to give types different names (e.g `[Char] == String`)
```haskell
type String = [Char]
```

- Can be used to clarify what type variables are used for
```haskell
-- Without type synonym
type PhoneBook = [(String,String)]
-- With type synonym
type PhoneNumber = String
type Name = String
type PhoneBook = [(Name,PhoneNumber)]
```

- Can be parameterized so that we can still access the types
```haskell
type AssocList k v = [(k,v)]
foo :: (Eq k) => k -> AssocList k v -> Maybe v. AssocList
```

- Type synonyms can be partially applied
- When we're interested in how some function failed or why, we usually use the result type of `Either a b`, where `a` is some sort of type that can tell us something about the possible failure and `b` is the type of a successful computation

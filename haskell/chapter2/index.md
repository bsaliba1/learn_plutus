# Chapter 2
[<- Back to Homepage](../../index.md)
## Types
- Haskell is statically typed
- Explicit types always start with a capital letter
- Type decleration is when you explicitly state the type of a function or variable
  - ex.

    ```
    removeNonUppercase :: [Char] -> [Char]
    removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
    ```

### Common Types
  - `Int`: Whole numbers (max: 2147483647, min: -2147483648)
    - More efficient than `Integer`
  - `Integer`: Whole numbers but unbounded
    - Less efficient than `Int`
  - `Float`: Real floating point accurate up to 6 decimal places
  - `Double`: Real floating point accurate up to 12 decimal places (double the precision!)
  - `Bool`: Boolean type with two values `True` or `False`
  - `Char`: Represents a character and is denoted by single quotes `''`

### Type Variables
- Denoted as `a`,`b`,`c`, etc.
- Variables used in type declarations that can be used to denote any type
- Known as generics in other languages
- Functions that utilize type variables are known as **polymorphic functions**
- Easily allows us to write general functions that don't use type specific behaviour

### Helper functions
- `:t`: gets the return type of an expression

## Typeclasses
- A typeclass is a sort of interface that defines some behavior for all the types contained in the typeclass
- A type is part of a type class
```
ghci> :t (==)
(==) :: (Eq a) => a -> a -> Bool
```

- The above type decleration can de read as follows
> The equality function takes any two values that are of the same type and returns a Bool. The type of those two values must be a member of the Eq class (this was the class constraint).

- We see a new thing here, the `=>` symbol. Everything before the `=>` symbol is called a **class constraint**.
- The `Eq` typeclass provides an interface for testing for equality.

### `Eq`
-  used for types that support equality testing

### `Ord` is for types that have an ordering
### `Show` is for presenting a type as a string
	- most function for dealing with the `Show` typeclass is `show`
	```
	ghci> show 3
	"3"
	ghci> show True
	"True"
	```

### `Read` is used for converting a string to a type
- most function for dealing with the `Read` typeclass is `read`
- Using implicit typing
```
ghci> read "True" || False
True
ghci> read "8.2" + 3.8
12.0
ghci> read "5" - 2
3
ghci> read "[1,2,3,4]" ++ [3]
[1,2,3,4,3]
```

- Using explicit typing
```
ghci> read "5" :: Int
5
ghci> read "5" :: Float
5.0
ghci> (read "5" :: Float) * 4
20.0
ghci> read "[1,2,3,4]" :: [Int]
[1,2,3,4]
ghci> read "(3, 'a')" :: (Int, Char)
(3, 'a')
```

### `Enum` members are sequentially ordered types
- `succ` gets the next enum
- `pred` gets the previous enum
```
ghci> ['a'..'e']
"abcde"
ghci> [LT .. GT]
[LT,EQ,GT]
ghci> [3 .. 5]
[3,4,5]
ghci> succ 'B'
'C'
```

### `Bounded` members have an upper and a lower bound.
```
ghci> minBound :: Int
-2147483648
ghci> maxBound :: Char
'\1114111'
ghci> maxBound :: Bool
True
ghci> minBound :: Bool
False
```

- `minBound` and `maxBound` are useful functions

### `Num` can act as numbers
- contains all real numbers and integral numbers (whole numbers)
- whole numbers can act like any type contained in the `Num` typeclass
- To join `Num`, a type must already be friends with `Show` and `Eq`.
- A very useful function for dealing with numbers is fromIntegral
```
ghci> 20 :: Int
20
ghci> 20 :: Integer
20
ghci> 20 :: Float
20.0
ghci> 20 :: Double
20.0
```

### `Integral` contains only whole numbers
- this typeclass includes `Int` and `Integer`
### `Floating` contains `Double` and `Float`

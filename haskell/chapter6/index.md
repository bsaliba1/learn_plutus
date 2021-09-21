# Chapter 6 - Modules
[⬅︎ Back to Homepage](../../index.md)

## What is a Module?
- A module is a collection of related functions, types, and typeclasses
- A program is a collection of modules where the main module loads up the other modules and then uses the functions defined in them to do something
- A module can be loaded using `import <module name>`
	- Specific functions can be loaded using `import Data.List (nub, sort)`
	- Specific functions can be excluded using `import Data.List hiding (nub)`
	- To avoid importing a function with the same name we can use qualified imports `import qualified Data.Map as M`
		- To reference Prelude's `filter` function we call `filter`
		- To reference Map's `filter` function we call `M.filter`
  - example
	```haskell
	import Data.List
  -- Data.List defines 'nub'
	numUniques :: (Eq a) => [a] -> Int
	numUniques = length . nub
	```

- In GHCI a module can be loaded using `ghci> :m + <module name>`
	- example
	```haskell
	ghci> :m + Data.List Data.Map Data.Set
	```

## Module References
- [Standard Library Documentation](https://downloads.haskell.org/~ghc/latest/docs/html/libraries/)
- [Module Lookup (Hoogle)](http://haskell.org/hoogle)

## Helpful Module Functions
### Data.List
#### General
- `isPrefixOf` - search for a sublist at the beginning of a list
- `isSuffixOf` - search for a sublist at the end of a list
- `isInfixOf` - searches for a sublist within a list and returns True if the sublist we're looking for is somewhere inside the target list
- `span` - takes a list and a preciate and returns a pair of lists. The first list contains all the elements **until the predicate is not satisfied**. The second list contains everything else.
- `partition` - takes a list and a predicate and returns a pair of lists. The first list in the result contains all the elements that satisfy the predicate, the second contains all the ones that don't.
- `elem` - check if an element is inside a list
- `elemIndex` - is kind of like elem, only it doesn't return a boolean value. It maybe returns the index of the element we're looking for. If that element isn't in our list, it returns a `Nothing`
- `elemIndices` is like elemIndex, only it returns a list of indices, in case the element we're looking for crops up in our list several times. Because we're using a list to represent the indices, we don't need a Maybe type, because failure can be represented as the empty list, which is very much synonymous to `Nothing`
- `zip` - zip together two lists into a list of tuples
- `zipWith` - zip together two lists using a binary function
- `nub` - eliminates duplicates
- `delete` - takes an element and a list and deletes the first occurence of that element in the list


#### String Parsing
- `lines` - splits a block of text using `\n` as the dilineator (helpful for working with input files)
- `unlines` - combines several strings without `\n` into one string
- `words` - split text into words (using `' '` character)
- `unwords` - combine several strings into words (using `' '` character)

#### List Comparison
- `\\` - list difference operation
- `union` - works like set union. It returns the union of the two lists
- `intersect` - works like set intersection. It returns only the elements that are found in both lists.

### Data.Char
- `isUpper` - tells whether or not the given char is an uppercase character
- `isLower` - tells whether or not the given char is a lowercase character
- `isLetter` - checks whether a character is a letter
- `isDigit` - checks whether a character is a digit
- `toUpper` - converts a character to upper-case. Spaces, numbers, and the like remain unchanged
- `toLower` - converts a character to lower-case
- `digitToInt` - converts a character to an Int. To succeed, the character must be in the ranges '0'..'9', 'a'..'f' or 'A'..'F'
- `intToDigit` - is the inverse function of `digitToInt`. It takes an Int in the range of 0..15 and converts it to a lower-case character
- `ord` and `chr` functions convert characters to their corresponding numbers and vice versa:

#### `generalCategory` Data Type
- Used to determine the general category of a character
```haskell
ghci> generalCategory ' '
Space
ghci> generalCategory 'A'
UppercaseLetter
ghci> generalCategory 'a'
LowercaseLetter
ghci> generalCategory '.'
OtherPunctuation
ghci> generalCategory '9'
DecimalNumber
ghci> map generalCategory " \t\nA9?|"
[Space,Control,Control,UppercaseLetter,DecimalNumber,OtherPunctuation,MathSymbol]
```

### Data.Map
- `fromList` - takes an association list and returns a map data type
- `empty` - represents an empty map. It takes no arguments, it just returns an empty map
- `insert` - takes a key, a value and a map and returns a new map that's just like the old one, only with the key and value inserted
- `null` - checks if a map is empty
- `size` - reports the size of a map
- `lookup` - works like the Data.List lookup, only it operates on maps. It returns Just something if it finds something for the key and Nothing if it doesn't
- `member` - is a predicate takes a key and a map and reports whether the key is in the map or not
- `map` and `filter` - work much like their list equivalents. These functions operate on the value of the key value pair
- `toList` - is the inverse of fromList.

### Data.Set
- Checking for membership, inserting, deleting, etc. is much faster than doing the same thing with lists
- `fromList` - converts list to set
- `toList` - converts set to list
- `intersection` - checks common elements across two sets
- `difference` - checks elements that exist in set1 but not set2
- `union` - combines all elements in set1 and set2

### Making a Module
- You can only use functions that are exported by a module
- Start by defining the module name
- Define exported function names
- Implement functions
```haskell
module Cube
( volume
, area
) where

import qualified Geometry.Cuboid as Cuboid

volume :: Float -> Float
volume side = Cuboid.volume side side side

area :: Float -> Float
area side = Cuboid.area side side side
```

- To give modules a hierarchical structure, make a directory with the top level module name and then have the individual files have submodule names:
```bash
|-> Geometry
|		|-> Sphere # Defines Geometry.Sphere module
|   |-> Cube # Defines Geometry.Cube module
```

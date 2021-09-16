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


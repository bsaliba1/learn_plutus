# Chapter 5
[⬅︎ Back to Homepage](../../index.md)

## Higher Order Functions
- Definition: Haskell functions can take functions as parameters and return functions as return values.

### Curried Functions
- Every function in Haskell officially only takes one parameter
- If too few parameters are passed into a function then a partially applied function is returned
```haskell
compare' x y = x > y
compareWithTwo = compare' 2
compareWithTwo 4
--- returns false
```

- Infix functions can also be partially applied by using sections
```haskell
addTwo :: (Integral a) => a -> a
addTwo = (+2)
```

- `addTwo 4` is the same as doing `(+2) 4`

### Map, Filter, and TakeWhile
- `map` takes a function and a list and applies that function to every element in the list, producing a new list
```haskell
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x: map' f xs
```

- `filter` is a function that takes a predicate (a predicate is a function that tells whether something is true or not, so in our case, a function that returns a boolean value) and a list and then returns the list of elements that satisfy the predicate.
```haskell
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
  | p x = x : filter' p xs
  | otherwise = filter' p xs
```

- `takeWhile` takes a predicate and a list and then goes from the beginning of the list and returns its elements while the predicate holds true

### Lambdas
- Lambdas are basically anonymous functions that are used because we need some functions only once
- Notation: `\param1 param2 -> definition`
- Usually surrounded by parenthesis `(\param1 param2 -> definition)`

### Folds
- Folds can be used to implement any function where you traverse a list once, element by element, and then return something based on that. Whenever you want to traverse a list to return something, chances are you want a fold
- Same as `reduce` in Javascript
- `foldl` folds from the left. Equivalent to:
```haskell
recursiveFunction _ acc [] = acc
recursiveFunction f acc (x:xs) = acc + (f x) + recursiveFunction f xs
```

- `foldr` folds from the right. Equivalent to:
```haskell
recursiveFunction _ acc [] = acc
recursiveFunction f acc (x:xs) = acc + recursiveFunction f xs + (f x)
```

- ex.
```haskell
-- Sum without fold
sum' [] = 0
sum' (x:xs) = x + sum xs
-- Sum with fold
sum'' :: (Num a) => [a] -> a
sum'' xs = foldl (\acc x = acc +x ) 0 xs
```

- `foldl1` and `foldr1` don't need a starting value for the accumulator
- `scanl` and `scanr` are like `foldl` and `foldr`, only they report all the intermediate accumulator states in the form of a list

### Function Application
- Two ways of doing function application
  - Using a space `" "`
  - Using the `$` function

- `$` Defintion:
```haskell
($) :: (a -> b) -> a -> b
f $ x = f x
```

- Regular function application with a space has high precedence so it is left associative (e.g `foo bar y` == `(foo bar) y`
- Function application with the `$` function has low precedence so it is right associative (e.g `foo $ bar y` == `foo (bar y)`)
- `$` can be treated like any other function
```haskell
ghci> map ($ 3) [(4+), (10*), (^2), sqrt]
[7.0,30.0,9.0,1.7320508075688772]
```

### Function Composition
- Used to combine two functions
- Mathematical definition: `(f ◦ g)(x) = f(g(x))`
- Uses the `.` function
- `.` function is right associative (e.g `(f . g . h) x` == ` f (g (h x))`)
- example
```haskell
-- Without composition
ghci> map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24]
-- With composition
ghci> map (negate . abs) [5,-3,-6,7,-3,2,-19,24]
```

- `.` function does not work with functions that take multiple params so multi-argument functions must be partially applied
```haskell
ghci> (sum . replicate 5 . max 6.7) 8.9
44.5
```

### Point Free (Point*less*) Functions
- A function which does not explicitly mention the points (values) of the space on which the function acts
```haskell
-- Not Point Free
sum' :: (Num a) => [a] -> a
sum' xs = foldl (+) 0 xs
-- Point Free
sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0
```


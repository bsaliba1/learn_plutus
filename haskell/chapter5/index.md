# Chapter 5
[<- Back to Homepage](../../index.md)

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

## Map, Filter, and TakeWhile
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


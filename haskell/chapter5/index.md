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

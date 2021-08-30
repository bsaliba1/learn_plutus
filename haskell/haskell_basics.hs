doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100 then x else x*2
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
length' xs = sum [1 | x <- xs]
removeOddNumbers xxs = [ [x | x <- xs, even x] | xs <- xxs]
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st =
	[c | c <- st, c `elem` ['A'..'Z']]
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + (sum' xs)

-- Sample Problems
-- Problem 1
-- Get the last element in a list
myLast [x] = x
myLast (x:xs) = myLast xs
myLast' lst = head (reverse lst)

-- Problem 2
-- Get the second to last element in a list
mySecondLast [x,y] = x
mySecondLast (x:xs) = mySecondLast xs
mySecondLast' lst = head (reverse (init lst))

-- 20 Intermediate Haskell Exercises
-- http://blog.tmorris.net/posts/20-intermediate-haskell-exercises/

class Fluffy f where
  furry :: (a -> b) -> f a -> f b

-- Exercise 1
-- Relative Difficulty: 1
instance Fluffy [] where
  furry = map

-- Exercise 2
-- Relative Difficulty: 1
instance Fluffy Maybe where
  furry _ Nothing = Nothing
  furry f (Just a) = Just (f a)

-- Exercise 3
-- Relative Difficulty: 5
instance Fluffy ((->) t) where
  furry f g = f . g

newtype EitherLeft b a = EitherLeft (Either a b)
newtype EitherRight a b = EitherRight (Either a b)

-- Exercise 4
-- Relative Difficulty: 5
instance Fluffy (EitherLeft t) where
  furry f (EitherLeft (Right b)) = EitherLeft (Right b)
  furry f (EitherLeft (Left a)) = EitherLeft (Left (f a))

-- Exercise 5
-- Relative Difficulty: 5
instance Fluffy (EitherRight t) where
  furry f (EitherRight (Left a)) = EitherRight (Left a)
  furry f (EitherRight (Right b)) = EitherRight (Right (f b))

class Misty m where
  banana :: (a -> m b) -> m a -> m b
  unicorn :: a -> m a

-- Exercise 6
-- Relative Difficulty: 3
-- (use banana and/or unicorn)
furry' :: Misty m => (a -> b) -> m a -> m b
furry' f ma = banana (unicorn . f) ma

-- Exercise 7
-- Relative Difficulty: 2
instance Misty [] where
  banana f xs = [y | x <- xs , y <- f x]
  unicorn x = [x]

-- Exercise 8
-- Relative Difficulty: 2
instance Misty Maybe where
  banana f Nothing = Nothing
  banana f (Just a) = f a
  unicorn a = Just a

-- Exercise 9
-- Relative Difficulty: 6
instance Misty ((->) t) where
  banana f ma = \r -> f (ma r) r
  unicorn a = const a

-- Exercise 10
-- Relative Difficulty: 6
instance Misty (EitherLeft t) where
  banana f (EitherLeft ev) = case ev of
    Left a -> f a
    Right b -> EitherLeft (Right b)
  unicorn a = EitherLeft (Left a)

-- Exercise 11
-- Relative Difficulty: 6
instance Misty (EitherRight t) where
  banana f (EitherRight ev) = case ev of
    Left a -> EitherRight (Left a)
    Right b -> f b
  unicorn a = EitherRight (Right a)

-- Exercise 12
-- Relative Difficulty: 3
jellybean :: (Misty m) => m (m a) -> m a
jellybean x = id `banana` x

-- Exercise 13
-- Relative Difficulty: 6
apple :: (Misty m) => m a -> m (a -> b) -> m b
apple mx mf = (\x -> (\f -> unicorn (f x)) `banana` mf) `banana` mx

-- -- Exercise 14
-- -- Relative Difficulty: 6
-- moppy :: (Misty m) => [a] -> (a -> m b) -> m [b]
-- moppy = error "todo"
--
-- -- Exercise 15
-- -- Relative Difficulty: 6
-- -- (bonus: use moppy)
-- sausage :: (Misty m) => [m a] -> m [a]
-- sausage = error "todo"
--
-- -- Exercise 16
-- -- Relative Difficulty: 6
-- -- (bonus: use apple + furry')
-- banana2 :: (Misty m) => (a -> b -> c) -> m a -> m b -> m c
-- banana2 = error "todo"
--
-- -- Exercise 17
-- -- Relative Difficulty: 6
-- -- (bonus: use apple + banana2)
-- banana3 :: (Misty m) => (a -> b -> c -> d) -> m a -> m b -> m c -> m d
-- banana3 = error "todo"
--
-- -- Exercise 18
-- -- Relative Difficulty: 6
-- -- (bonus: use apple + banana3)
-- banana4 :: (Misty m) => (a -> b -> c -> d -> e) -> m a -> m b -> m c -> m d -> m e
-- banana4 = error "todo"
--
-- newtype State s a = State {
--   state :: (s -> (s, a))
-- }
--
-- -- Exercise 19
-- -- Relative Difficulty: 9
-- instance Fluffy (State s) where
--   furry = error "todo"
--
-- -- Exercise 20
-- -- Relative Difficulty: 10
-- instance Misty (State s) where
--   banana = error "todo"
--   unicorn = error "todo"

-- module Stack(Stack(),push,top,pop,emptyStack,empty) where
-- 
-- data Stack a = EmptyStack | Push a (Stack a)
-- 
-- push  :: a -> Stack a -> Stack a
-- push x xs = Push x xs
-- 
-- top   :: Stack a -> a
-- top (Push x xs) = x
-- 
-- pop   :: Stack a -> Stack a
-- pop (Push x xs) = xs
-- 
-- emptyStack:: Stack a
-- emptyStack = EmptyStack
-- 
-- empty :: Stack a -> Bool
-- empty = EmptyStack
-- 

module Stack where

type Stack a = [a]
push :: a -> Stack a -> Stack a
push x xs = x:xs

pop :: Stack a -> Stack a
pop (x:xs) = xs

top :: Stack a -> a
top (x:xs) = x

empty :: Stack a -> Bool
empty [] = True
empty (x:xs) = False


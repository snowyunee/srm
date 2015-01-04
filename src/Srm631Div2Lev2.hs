
import Data.List

f (p, time, r) x
  | r == False     = (p', time, False)
  | p' > max_p + 1 = (p', time, False)
  | otherwise      = (p', time, True)
  where min_p = max p (fst x - time)
        max_p = (fst x) + time
        p'    = min_p + (snd x)

getAnswer xs time = foldl f (-1000 - time - 1, time, True) xs

catOnTheLine positions counts time =
  (\x -> if (x == True) then "Possible" else "Impossible")
  $ (\(_,_,r) -> r)
  $ getAnswer (sort $ zip positions counts) time

main = do
  print $ catOnTheLine [0] [7] 3
  print $ catOnTheLine [0] [8] 2
  print $ catOnTheLine [0, 1] [3, 1] 0
  print $ catOnTheLine [5, 0, 2] [2, 3, 5] 2
  print $ catOnTheLine [5, 1, -10, 7, 12, 2, 10, 20] [3, 4, 2, 7, 1, 4, 3, 4] 6


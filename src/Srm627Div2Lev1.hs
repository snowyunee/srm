import qualified Data.Map as Map

count_rect :: Integral a => Map.Map k a -> a
count_rect m =
    Map.foldl (\acc v -> acc + (quot v 4)) 0 m

updateMap :: (Integral a, Ord k) => Map.Map k a -> k -> Map.Map k a
updateMap m k =
    Map.insertWith (\new_v old_v -> new_v + old_v) k 1 m

howManySquares l =
    last $
    map count_rect $
    scanl updateMap Map.empty l
   

-- | The main entry point.
main :: IO ()
main = do
    print $ howManySquares [1,1,2,2,1,1,2] -- 1
    print $ howManySquares [3,1,4,4,4,10,10,10,10] -- 1
    print $ howManySquares [1,2,3,4,1,2,3,4,1,2,3,1,2,3,4,1,2,3,3,3] -- 3
    print $ howManySquares [1,1,1,2,1,1,1,3,1,1,1] -- 2
    print $ howManySquares [2,2,4,4,8,8] -- 0

import qualified Data.Map as Map

countRect :: Integral a => Map.Map k a -> a
countRect m =
    Map.foldl (\acc v -> acc + (quot v 4)) 0 m

updateMap :: (Integral a, Ord k) => Map.Map k a -> k -> Map.Map k a
updateMap m k =
    Map.insertWith (+) k 1 m

howManySquares ls =
    last $
    map countRect $
    scanl updateMap Map.empty ls
   

-- | The main entry point.
main :: IO ()
main = do
    print $ howManySquares [1,1,2,2,1,1,2] -- 1
    print $ howManySquares [3,1,4,4,4,10,10,10,10] -- 1
    print $ howManySquares [1,2,3,4,1,2,3,4,1,2,3,1,2,3,4,1,2,3,3,3] -- 3
    print $ howManySquares [1,1,1,2,1,1,1,3,1,1,1] -- 2
    print $ howManySquares [2,2,4,4,8,8] -- 0

import qualified Data.Map as Map

countRect :: Integral a => Map.Map k a -> a
countRect m =
    Map.foldl (\acc v -> acc + (quot v 4)) 0 m


updateMap :: (Ord k, Integral a) => k -> Map.Map k a -> Map.Map k a
updateMap k =
    Map.insertWith (+) k 1


howManySquares :: (Ord a, Integral b) => [a] -> b
howManySquares ls =
    last $
    map countRect $
    scanl (\m k -> updateMap k m) Map.empty ls
   

-- | The main entry point.
main :: IO ()
main = do
    print $ howManySquares [1,1,2,2,1,1,2] -- 1
    print $ howManySquares [3,1,4,4,4,10,10,10,10] -- 1
    print $ howManySquares [1,2,3,4,1,2,3,4,1,2,3,1,2,3,4,1,2,3,3,3] -- 3
    print $ howManySquares [1,1,1,2,1,1,1,3,1,1,1] -- 2
    print $ howManySquares [2,2,4,4,8,8] -- 0

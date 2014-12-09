-- | Main entry point to the application.
module Srm633Div2Lev1 where
 
import Data.List   
 
able_to_get x y len =
    let
        sum = Data.List.sum len
        max = maximum len
        distance = sqrt (x*x + y*y)
    in
        if sum >= distance &&
           max <= sum - max + distance then "Able"
        else
           "Not able"
   
-- | The main entry point.
main :: IO ()
main = do
    print $ able_to_get 5 4 [2, 5]
    print $ able_to_get 3 4 [4]
    print $ able_to_get 3 4 [6]
    print $ able_to_get 0 1 [100, 100]

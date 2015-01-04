-- | Main entry point to the application.
-- RectangleCoveringEasy

module Srm629Div2Lev1 where
 
solve hh hw bh bw
    | hole_min > board_min || hole_max > board_max = -1
    | hole_min == board_min && hole_max == board_max = -1
    | otherwise = 1
    where
        hole_min = min hh hw
        hole_max = max hh hw
        board_min = min bh bw
        board_max = max bh bw
   
-- | The main entry point.
main :: IO ()
main = do
    print $ solve 1 1 1 1 -- -1
    print $ solve 3 5 4 6 -- 1
    print $ solve 10 20 25 15 -- 1
    print $ solve 3 10 3 12 -- 1
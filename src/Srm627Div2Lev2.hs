
import qualified Data.Map as Map
import Data.Maybe
import Data.Tuple


f :: (Integral a, Ord k) => (Map.Map k a, k, a) -> k -> (Map.Map k a, k, a)
f (m,max_char,max_count) char = (m',max_char',max_count')
    where
     (max_char',max_count') = if (cur_count > max_count) then (char,cur_count) else (max_char,max_count)
     cur_count | isJust old_count = fromJust old_count + 1
               | otherwise = 1
     (old_count,m') = Map.insertLookupWithKey updateMap char 1 m
     updateMap = (\_ new_count old_count -> old_count + new_count)

happyLetter :: Integral n => n -> Char -> n -> Char
happyLetter total_count char count | total_count < (2 * count) = char
                                   | otherwise = '.'

getHappyLetter :: String -> Char
getHappyLetter ls =
    last $
    map (\ (total_count, (_,char,count)) -> happyLetter total_count char count) $
    zip [0,1..] $
    scanl f (Map.empty,'.',0) ls


-- | The main entry point.
main :: IO ()
main = do
    print $ getHappyLetter "aacaaa" -- a
    print $ getHappyLetter "dcdjx" -- .
    print $ getHappyLetter "bcbbbbba" -- b
    print $ getHappyLetter "aabc" -- .


import Stack
import Debug.Trace


is_pair a b
    | a == '(' && b == ')' || b == '(' && a == ')' = True
    | a == '[' && b == ']' || b == '[' && a == ']' = True
    | a == '{' && b == '}' || b == '{' && a == '}' = True
    | otherwise = False

remove_pair (stack, state) a
    | state == False = (stack, state)
    | empty stack = (stack, False)
    | otherwise = (if (is_pair (top stack) a) then (pop stack, state) else (stack, False))
        
f (stack, state) a
    | state == False = (stack, state)
    | a == ')' || a == ']' || a == '}' = remove_pair (stack, state) a
    | otherwise = (push a stack, state)

make_answer (stack, state)
    | ((empty stack) && (state == True)) = True
    | otherwise = False

make_all_cases expression =
     foldl (\ss bs -> [s++[b]| s<-ss, b<-bs]) [""] $
     map (\a -> if (a == 'X') then "()[]{}" else [a]) expression

ifPossible expression =
    (\answer -> if answer then "possible" else "impossible") $
    any (\e -> make_answer $ last $ scanl f ([],True) e) $
    make_all_cases expression
   


main :: IO ()
main = do
    print $ ifPossible "([]{})" -- possible
    print $ ifPossible "(())[]" -- possible
    print $ ifPossible "({])"  -- impossible
    print $ ifPossible "[]X" -- impossible
    print $ ifPossible "([]X()[()]XX}[])X{{}}]" -- possible

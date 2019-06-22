-- [contest]  ABC 064
-- [task]     A
-- [URL]      https://atcoder.jp/contests/abc064/tasks/abc064_a
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc064/submissions/6045989 : WA
--            https://atcoder.jp/contests/abc064/submissions/6045998 : AC
--            https://atcoder.jp/contests/abc064/submissions/6046078 : AC

-- [reference]
-- https://qiita.com/hnw/items/3f7d27b742c5a1a99a9a
-- https://myuon.github.io/posts/haskell-atcoder/

-- modules to import
import Control.Monad
import Data.Maybe
import qualified Data.ByteString.Char8 as DataByStrChr8



-- functions for input

read_Integer      = fst . fromJust . DataByStrChr8.readInteger
read_list_Integer = map read_Integer . DataByStrChr8.words

get_Integer      = read_Integer      <$> DataByStrChr8.getLine
get_list_Integer = read_list_Integer <$> DataByStrChr8.getLine



-- functions for ABC 064, Task A

calculate_target :: [Integer] -> Integer
calculate_target [red, green, blue] = 100 * red + 10 * green + blue

is_multiple :: Integer -> Integer -> Bool
is_multiple target base
        | mod target base == 0 = True
        | otherwise            = False

evaluate_given_data :: [Integer] -> Bool
evaluate_given_data [red, green, blue] = is_multiple (calculate_target [red, green, blue]) 4



-- main process is below

main :: IO ()
main = do

        -- STEP.01
        -- read out the given integers
        [red, green, blue] <- get_list_Integer

        -- STEP.02
        -- evaluate the given integets
        -- output the result of the evaluation
        putStrLn $ if (evaluate_given_data [red, green, blue]) then "YES" else "NO"

-- End of this source code

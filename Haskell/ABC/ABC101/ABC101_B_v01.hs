-- [contest]  ABC 101
-- [task]     B
-- [URL]      https://atcoder.jp/contests/abc101/tasks/abc101_b
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc101/submissions/6099337 ; AC

-- [reference]
-- http://hackage.haskell.org/package/bytestring-0.10.8.2/docs/Data-ByteString-Char8.html
-- https://qiita.com/hnw/items/3f7d27b742c5a1a99a9a
-- https://myuon.github.io/posts/haskell-atcoder/

-- modules to import --

import Data.ByteString.Char8
import Data.Maybe
import Prelude

-- functions for this task --

read_Integer = fst . fromJust . Data.ByteString.Char8.readInteger
get_Integer  = read_Integer <$> Data.ByteString.Char8.getLine

calculate_digit_sum :: Integer -> Integer
calculate_digit_sum target
        | target >= 10 = (mod target 10) + (calculate_digit_sum $ div target 10)
        | target >=  0 = target  

task_B :: Integer -> Bool
task_B target
        | mod target (calculate_digit_sum target) == 0 = True
        | otherwise                                    = False

-- main process is below --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given integer
        integer_given <- get_Integer

        -- STEP.02
        -- output the answer of this task
        Prelude.putStrLn $ if (task_B $ integer_given) then "Yes" else "No"

-- End of this source code --

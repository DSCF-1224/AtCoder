-- [contest]  ABC 081
-- [task]     A
-- [URL]      https://atcoder.jp/contests/abc081/tasks/abc081_a
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc081/submissions/6131172 : AC

-- [reference]
-- http://hackage.haskell.org/package/bytestring-0.10.8.2/docs/Data-ByteString-Char8.html
-- https://qiita.com/hnw/items/3f7d27b742c5a1a99a9a
-- https://myuon.github.io/posts/haskell-atcoder/

-- modules to import --
import Data.ByteString.Char8
import Data.Maybe
import Prelude

-- functions for this task --

read_Integer = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
get_Integer  = read_Integer <$> Data.ByteString.Char8.getLine

task_A :: Integer -> Integer
task_A target
        | target < 10 = target
        | otherwise   = val_mod + (task_A $ val_div)
        where
                (val_div, val_mod) = divMod target 10


-- main process is below --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given string
        given_data <- get_Integer

        -- STEP.02
        -- output the answer of this task
        Prelude.print $ task_A $ given_data

-- End of this source code --

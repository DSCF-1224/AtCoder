-- [contest]  ABC 081
-- [task]     B
-- [URL]      https://atcoder.jp/contests/abc081/tasks/abc081_b
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc081/submissions/6131505 : AC

-- [reference]
-- http://hackage.haskell.org/package/bytestring-0.10.8.2/docs/Data-ByteString-Char8.html
-- https://qiita.com/hnw/items/3f7d27b742c5a1a99a9a
-- https://myuon.github.io/posts/haskell-atcoder/

-- modules to import --
import Data.ByteString.Char8
import Data.Maybe
import Prelude

-- functions for this task --

read_Integer     = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
read_ListInteger = Prelude.map read_Integer . Data.ByteString.Char8.words

get_Integer     = read_Integer     <$> Data.ByteString.Char8.getLine
get_ListInteger = read_ListInteger <$> Data.ByteString.Char8.getLine

task_B_unit :: Integer -> Integer
task_B_unit target
        | Prelude.even target == True = 1 + (task_B_unit $ div target 2)
        | otherwise                   = 0

task_B :: [Integer] -> Integer
task_B given_list
        | given_list == [] = 10^9
        | otherwise        = Prelude.min (task_B_unit $ Prelude.head given_list) (task_B $ Prelude.tail given_list)


-- main process is below --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given string
        len_sequence <- get_Integer
        val_sequence <- get_ListInteger

        -- STEP.02
        -- output the answer of this task
        Prelude.print $ task_B $ val_sequence

-- End of this source code --

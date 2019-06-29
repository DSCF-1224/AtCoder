-- [contest]  ABC 132
-- [task]     C
-- [URL]      https://atcoder.jp/contests/abc132/tasks/abc132_c
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   NOT Submitted

-- [reference]
-- http://hackage.haskell.org/package/bytestring-0.10.8.2/docs/Data-ByteString-Char8.html
-- https://qiita.com/hnw/items/3f7d27b742c5a1a99a9a
-- https://myuon.github.io/posts/haskell-atcoder/

-- modules to import --

import qualified Data.ByteString.Char8
import qualified Data.Maybe
import qualified Data.List
import           Prelude



-- functions for this task --

read_Integer     = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
read_ListInteger = Prelude.map read_Integer . Data.ByteString.Char8.words

get_Integer     = read_Integer     <$> Data.ByteString.Char8.getLine
get_ListInteger = read_ListInteger <$> Data.ByteString.Char8.getLine

task_C :: [Integer] -> Integer -> [Integer]
task_C given_data answer
        | answer == []              = task_C given_data [0,0]
        | Data.List.length list >=1 = task_C (Data.List.tail given_data) [(Data.List.head $ answer) + ]
        | Prelude.otherwise         = answer

judge_ForABC :: Integer -> Integer -> Integer
judge_ForABC target border
        | target < border   = 1
        | Prelude.otherwise = 0

judge_ForARC :: Integer -> Integer -> Integer
judge_ForARC target border
        | target < border   = 0
        | Prelude.otherwise = 1


-- main process is below --

task_A :: Integer -> Integer -> Integer -> Integer
task_A val_budget val_cake val_doughnut = mod (val_budget - val_cake) val_doughnut

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        val_sequence <- get_ListInteger

        -- STEP.02
        -- output the answer of this task
        Prelude.print $ task_C $ Data.List.sort $ val_sequence

-- End of this source code --

-- [contest]  ABC 087
-- [task]     A
-- [URL]      https://atcoder.jp/contests/abc087/tasks/abc087_a
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc087/submissions/6142734 : AC

-- [reference]
-- http://hackage.haskell.org/package/bytestring-0.10.8.2/docs/Data-ByteString-Char8.html
-- https://qiita.com/hnw/items/3f7d27b742c5a1a99a9a
-- https://myuon.github.io/posts/haskell-atcoder/

-- modules to import --
import qualified Data.ByteString.Char8
import qualified Data.Maybe
import           Prelude

-- functions for this task --
read_Integer = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
get_Integer  = read_Integer <$> Data.ByteString.Char8.getLine

-- main process is below --

task_A :: Integer -> Integer -> Integer -> Integer
task_A val_budget val_cake val_doughnut = mod (val_budget - val_cake) val_doughnut

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        val_budget   <- get_Integer
        val_cake     <- get_Integer
        val_doughnut <- get_Integer

        -- STEP.02
        -- output the answer of this task
        Prelude.print $ task_A val_budget val_cake val_doughnut

-- End of this source code --

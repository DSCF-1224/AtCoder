-- [contest]  ABC 087
-- [task]     B
-- [URL]      https://atcoder.jp/contests/abc087/tasks/abc087_b
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   NOT Submitted

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

calculate_val_sum :: Integer -> Integer -> Integer -> Integer
calculate_val_sum num_coins_500 num_coins_100 num_coins_050
        = 500 * num_coins_500
        + 100 * num_coins_100
        +  50 * num_coins_050

-- task_B :: Integer -> Integer -> Integer -> Integer -> Integer
-- task_B num_coins_500 num_coins_100 num_coins_050 val_sum_target

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        num_coins_500  <- get_Integer
        num_coins_100  <- get_Integer
        num_coins_050  <- get_Integer
        val_sum_target <- get_Integer

        -- STEP.02
        -- output the answer of this task
        Prelude.print $ calculate_val_sum 0 0 0
        Prelude.print $ calculate_val_sum 0 0 1
        Prelude.print $ calculate_val_sum 0 1 0
        Prelude.print $ calculate_val_sum 1 0 0

-- End of this source code --

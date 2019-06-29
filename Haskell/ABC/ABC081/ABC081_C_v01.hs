-- [contest]  ABC 081
-- [task]     C
-- [URL]      https://atcoder.jp/contests/abc081/tasks/arc086_a
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   NOT Submitted

-- [reference]
-- http://hackage.haskell.org/package/bytestring-0.10.8.2/docs/Data-ByteString-Char8.html
-- https://qiita.com/hnw/items/3f7d27b742c5a1a99a9a
-- https://myuon.github.io/posts/haskell-atcoder/

-- modules to import --
import qualified Data.ByteString.Char8
import qualified Data.List
import qualified Data.Maybe
import           Prelude

-- functions for this task --
read_Integer     = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
read_ListInteger = Prelude.map read_Integer . Data.ByteString.Char8.words

get_Integer     = read_Integer     <$> Data.ByteString.Char8.getLine
get_ListInteger = read_ListInteger <$> Data.ByteString.Char8.getLine

count_num_different_Integers :: [Integer] -> Integer
count_num_different_Integers list
        | Prelude.length list == 1                            = 0
        | (Prelude.head $ list) == (Prelude.head $ tail_list) = Prelude.succ $ next_list
        | Prelude.otherwise                                   =                next_list
        where
                tail_list = Prelude.tail $ list
                next_list = count_num_different_Integers $ tail_list

-- main process is below --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        [len_sequence, val_limit] <- get_ListInteger
        val_sequence              <- get_ListInteger

        -- STEP.02
        -- output the answer of this task
        Prelude.print $ len_sequence
        Prelude.print $ val_limit
        Prelude.print $ val_sequence
        Prelude.print $ Data.List.sort $ val_sequence
        Prelude.print $ count_num_different_Integers $ Data.List.sort $ val_sequence

-- End of this source code --

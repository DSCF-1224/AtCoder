-- [contest]  ABC 086
-- [task]     A
-- [URL]      https://atcoder.jp/contests/abc086/tasks/abc086_a
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc086/submissions/6111941 : AC
--            https://atcoder.jp/contests/abc086/submissions/6120124 : AC

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

isMultiple :: Integer -> Integer -> Bool
isMultiple target base = mod target base == 0

isEven :: Integer -> Bool
isEven target = isMultiple target 2

task_A :: [Integer] -> ByteString
task_A [a, b] = Data.ByteString.Char8.pack $ if (isEven $ a * b) then "Even" else "Odd"

-- main process is below --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given string
        [a, b] <- get_ListInteger

        -- STEP.02
        -- output the answer of this task
        Data.ByteString.Char8.putStrLn $ task_A $ [a, b]

-- End of this source code --

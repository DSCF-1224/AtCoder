-- [contest]  ABC 001
-- [task]     A
-- [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_1
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc001/submissions/6401389 ; AC

-- modules to import --

import qualified Data.ByteString.Char8
import qualified Data.Maybe
import           Prelude

-- functions for this task --

read_Integer = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
get_Integer  = read_Integer <$> Data.ByteString.Char8.getLine

-- the main process is as follows --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        height_1st <- get_Integer
        height_2nd <- get_Integer

        -- STEP.02
        -- calculate & output the answer of this task
        Prelude.print $ Prelude.uncurry (-) (height_1st, height_2nd)

-- EOF --

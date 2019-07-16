-- [contest]  ABC 001
-- [task]     B
-- [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_2
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc001/submissions/6408045 : WA
--            https://atcoder.jp/contests/abc001/submissions/6410694 : WA
--            https://atcoder.jp/contests/abc001/submissions/6410698 : WA
--            https://atcoder.jp/contests/abc001/submissions/6410707 : WA
--            https://atcoder.jp/contests/abc001/submissions/6410728 : AC

-- modules to import --

import qualified Data.ByteString.Char8
import qualified Data.Maybe
import qualified Text.Printf
import           Prelude

-- functions for this task --

read_Integer = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
get_Integer  = read_Integer <$> Data.ByteString.Char8.getLine

convert_ToKiloMeter :: Integer -> Integer
convert_ToKiloMeter val_meter = Prelude.div (val_meter) (1000)

calculate_visibility :: Integer -> Integer
calculate_visibility val_meter
        | val_meter <    100 = 0
        | val_meter <=  5000 = convert_ToKiloMeter $ val_meter * 10
        | val_meter <= 30000 = (convert_ToKiloMeter $ val_meter) + 50
        | val_meter <= 70000 = (Prelude.div ((convert_ToKiloMeter $ val_meter) - 30) (5)) + 80
        | Prelude.otherwise  = 89

-- the main process is as follows --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        val_meter <- get_Integer

        -- STEP.02
        -- calculate & output the answer of this task
        Text.Printf.printf "%2.2d\n" (calculate_visibility $ val_meter)

-- EOF --

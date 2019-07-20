-- [contest]  ABC 001
-- [task]     C
-- [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_3
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   NOT Submitted

-- modules to import --

import qualified Data.ByteString.Char8
import qualified Data.Maybe
import qualified Text.Printf
import           Prelude

-- functions for this task --

tuplify2 (x:y:_) = (x,y)
tuplify2 _       = Prelude.undefined

read_Integer      = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
read_TupleInteger = tuplify2 . Prelude.map read_Integer . Data.ByteString.Char8.words

get_Integer      = read_Integer      <$> Data.ByteString.Char8.getLine
get_TupleInteger = read_TupleInteger <$> Data.ByteString.Char8.getLine

wind_Direction_core :: Integer -> Data.ByteString.Char8.ByteString
wind_Direction_core degree
        | degree_scaled >=  1125 && degree_scaled <=  3374 = Data.ByteString.Char8.pack $ "NNE"
        | degree_scaled >=  3375 && degree_scaled <=  5624 = Data.ByteString.Char8.pack $ "NE"
        | degree_scaled >=  5625 && degree_scaled <=  7874 = Data.ByteString.Char8.pack $ "ENE"
        | degree_scaled >=  7875 && degree_scaled <= 10124 = Data.ByteString.Char8.pack $ "E"
        | degree_scaled >= 10125 && degree_scaled <= 12374 = Data.ByteString.Char8.pack $ "ESE"
        | degree_scaled >= 12375 && degree_scaled <= 14624 = Data.ByteString.Char8.pack $ "SE"
        | degree_scaled >= 14625 && degree_scaled <= 16874 = Data.ByteString.Char8.pack $ "SSE"
        | degree_scaled >= 16875 && degree_scaled <= 19124 = Data.ByteString.Char8.pack $ "S"
        | degree_scaled >= 19125 && degree_scaled <= 21374 = Data.ByteString.Char8.pack $ "SSW"
        | degree_scaled >= 21375 && degree_scaled <= 23624 = Data.ByteString.Char8.pack $ "SW"
        | degree_scaled >= 23625 && degree_scaled <= 25874 = Data.ByteString.Char8.pack $ "WSW"
        | degree_scaled >= 25875 && degree_scaled <= 28124 = Data.ByteString.Char8.pack $ "W"
        | degree_scaled >= 28125 && degree_scaled <= 30374 = Data.ByteString.Char8.pack $ "WNW"
        | degree_scaled >= 30375 && degree_scaled <= 32624 = Data.ByteString.Char8.pack $ "NW"
        | degree_scaled >= 32625 && degree_scaled <= 34874 = Data.ByteString.Char8.pack $ "NNW"
        | Prelude.otherwise                                = Data.ByteString.Char8.pack $ "N"
        where
                degree_scaled = degree * 10

wind_Direction :: Integer -> Integer -> Data.ByteString.Char8.ByteString
wind_Direction degree wind_force
        | wind_force == 0   = Data.ByteString.Char8.pack $ "C"
        | Prelude.otherwise = wind_Direction_core $ degree

calc_wind_force :: Integer -> Integer
calc_wind_force wind_run
        | wind_speed <=   2 =  0
        | wind_speed <=  15 =  1
        | wind_speed <=  33 =  2
        | wind_speed <=  54 =  3
        | wind_speed <=  79 =  4
        | wind_speed <= 107 =  5
        | wind_speed <= 138 =  6
        | wind_speed <= 171 =  7
        | wind_speed <= 207 =  8
        | wind_speed <= 244 =  9
        | wind_speed <= 284 = 10
        | wind_speed <= 326 = 11
        | Prelude.otherwise = 12
        where
                wind_speed = Prelude.truncate $ (realToFrac $ wind_run) / (6.0 :: Double) + (0.5 :: Double)

-- the main process is as follows --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        given_data <- get_TupleInteger

        -- STEP.02
        -- calculate the wind force
        let val_wind_force = calc_wind_force $ Prelude.snd $ given_data

        -- STEP.03
        -- detect the wind direction & output the answer of this task
        Data.ByteString.Char8.putStr $ wind_Direction (Prelude.fst $ given_data) (val_wind_force)
        Data.ByteString.Char8.putStr $ (Data.ByteString.Char8.pack $ " ")
        Prelude.print                $ val_wind_force

-- EOF --

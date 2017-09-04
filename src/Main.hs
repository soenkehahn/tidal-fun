{-# LANGUAGE OverloadedStrings #-}

import Control.Concurrent
import Control.Monad
import Data.Function
import Sound.Tidal.Context
import Utils

main :: IO ()
main = do
  (cps, getNow) <- bpsUtils
  (d1, t1) <- connect "192.168.1.3" 57129 getNow
  cps 0.5
  d1 $
    silence
    & overlay (sound "~ 808ht" & fast 8)
    & overlay (sound "bd ~ sd ~ ~ bd sd [~ sd]")
    & overlay (sound "hh ~" & fast 8 & (# gain 0.8))
    & overlay (sound "~ hh" & fast 8)
    & every 5 (jux (0.125 ~>))
    & every 7 (linger 0.5)
    & every 2 (trunc ((3 / 4) + 0.01))
    & every 4 (trunc ((4 / 8) + 0.01))
    & every 4 (overlay $ sound "~ ~ ~ ~ ~ ~ sd ~")
    & every 8 (trunc ((1 / 4) + 0.01))
    & every 8 (overlay $ sound "~ ~ ~ ~ ~ ~ sd ~")
    & every 16 (trunc ((0 / 4) + 0.01))
    & every 16 (overlay $ sound "~ ~ ~ ~ ~ ~ sd ~")
  forever $ threadDelay 1000000

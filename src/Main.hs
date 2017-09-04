{-# LANGUAGE OverloadedStrings #-}

import Control.Concurrent
import Control.Monad
import Sound.Tidal.Context
import Utils

main :: IO ()
main = do
  (cps, getNow) <- bpsUtils
  (d1, t1) <- connect "192.168.1.3" 57129 getNow
  cps 1
  d1 $ sound "bd sn"
  forever $ threadDelay 1000000

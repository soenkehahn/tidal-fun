{-# LANGUAGE OverloadedStrings #-}

import Control.Concurrent
import Control.Monad
import Sound.Tidal.Context

main :: IO ()
main = do
  (cps, getNow) <- bpsUtils
  (d1, t1) <- superDirtSetters getNow
  cps 1
  d1 $ sound "bd sn"
  forever $ threadDelay 1000

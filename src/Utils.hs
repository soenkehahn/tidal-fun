module Utils
  ( connect
  ) where

import Sound.Tidal.Context
       hiding (superDirtBackend, superDirtSetters, superDirtState)
import Sound.Tidal.OscStream
import Sound.Tidal.Stream

connect ::
     String
  -> Int
  -> IO Time
  -> IO ( ParamPattern -> IO ()
        , (Time -> [ParamPattern] -> ParamPattern) -> ParamPattern -> IO ())
connect host port getNow = do
  ds <- superDirtState host port
  return (setter ds, transition getNow ds)

superDirtState host port = do
  backend <- superDirtBackend host port
  Sound.Tidal.Stream.state backend dirt

superDirtBackend host port = do
  s <- makeConnection host port superDirtSlang
  return $ Backend s (\_ _ _ -> return ())

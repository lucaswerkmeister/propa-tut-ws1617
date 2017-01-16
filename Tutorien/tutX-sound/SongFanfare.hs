module SongFanfare where

import Wave
import Notes
import Sound

fanfareBase = [
  ("e2", 2),
  ("", 11),
  ("d#2", 2),
  ("", 1),
  ("", 1/2),
  ("e2", 3/2),
  ("", 1/2),
  ("e2", 3/2),
  ("", 1/2),
  ("e2", 3/2),
  ("", 1/2),
  ("c2", 3/2),
  ("", 1),
  ("e2", 1/2),
  ("b1", 1/2),
  ("e2", 1/2),
  ("b1", 1/2),
  ("e2", 1/2),
  ("b1", 1/6),("b1", 1/6),("b1", 1/6),
  ("e2", 1/2),
  ("b1", 1/2),
  ("e2", 1/2),
  ("b1", 1/2),
  ("e2", 1/2),
  ("b1", 1/2),
  ("e2", 1/2),
  ("b1", 1/2),
  ("e2", 1)
  ]

fanfareTrumpet1 = [
  ("e4", 1),
  ("", 1/2),
  ("e4", 1/6),("e4", 1/6),("e4", 1/6),
  ("e4", 1),
  ("", 1/2),
  ("e4", 1/6),("e4", 1/6),("e4", 1/6),
  ("e4", 1),
  ("e4", 1/6),("", 2/6),
  ("e4", 1/6),("e4", 1/6),("e4", 1/6),
  ("e4", 1),
  ("e4", 1/2),
  ("", 1/4),
  ("g4", 1/4),
  ("g4", 1),
  ("e4", 1/4),("", 2/4),("g4", 1/4),
  ("g4", 1),
  ("e4", 1/4),("", 2/4),("a#4", 1/4),
  ("a#4", 2),
  ("", 1),
  ("a#4", 1/2),("a4", 1/4),("a#4", 1/4),
  ("b4", 3/2),("",1/4),("e4",1/4),
  ("b4", 3/2),("",1/4),("e4",1/4),
  ("b4", 3/2),("",1/4),("b3",1/4),
  ("e4", 3/2),("",1/2),
  ("b4", 8),
  ("b4", 1)
  ]
fanfareTrumpet2 = [
  ("e4", 1),
  ("", 1/2),
  ("e4", 1/6),("e4", 1/6),("e4", 1/6),
  ("d#4", 1),
  ("", 1/2),
  ("d#4", 1/6),("d#4", 1/6),("d#4", 1/6),
  ("c#4", 1),
  ("c#4", 1/6),("", 2/6),
  ("c#4", 1/6),("c#4", 1/6),("c#4", 1/6),
  ("b3", 1),
  ("b3", 1/2),
  ("", 1/4),
  ("e4", 1/4),
  ("e4", 1),
  ("c#4", 1/4),("", 2/4),("e4", 1/4),
  ("e4", 1),
  ("c#4", 1/4),("", 2/4),("g4", 1/4),
  ("g4", 2),
  ("", 1),
  ("g4", 1/2),("f#4", 1/4),("g4", 1/4),
  ("g#4", 3/2),("",1/4),("c4",1/4),
  ("g#4", 3/2),("",1/4),("c4",1/4),
  ("g#4", 3/2),("",1/4),("g#3",1/4),
  ("c4", 3/2),("",1/2),
  ("g#4", 8),
  ("g#4", 1)
  ]
fanfareTrumpet3 = [
  ("e4", 1),
  ("", 1/2),
  ("e4", 1/6),("e4", 1/6),("e4", 1/6),
  ("b3", 1),
  ("", 1/2),
  ("b3", 1/6),("b3", 1/6),("b3", 1/6),
  ("a3", 1),
  ("a3", 1/6),("", 2/6),
  ("a3", 1/6),("a3", 1/6),("a3", 1/6),
  ("g#3", 1),
  ("g#3", 1/2),
  ("", 1/4),
  ("c4", 1/4),
  ("c4", 1),
  ("a3", 1/4),("", 2/4),("c4", 1/4),
  ("c4", 1),
  ("a3", 1/4),("", 2/4),("d#4", 1/4),
  ("d#4", 2),
  ("", 1),
  ("d#4", 1/2),("d4", 1/4),("d#4", 1/4),
  ("e4", 3/2),("",1/4),("g3",1/4),
  ("e4", 3/2),("",1/4),("g3",1/4),
  ("e4", 3/2),("",1/4),("e3",1/4),
  ("g3", 3/2),("",1/2),
  ("e4", 8),
  ("e4", 1)
  ]

fanfareSpeed = 10/16

bass :: Instrument
bass freq = base * hull
  where
    base = modulatedSine (2*freq) (sine (3*freq))
    hull = hullCurve 0.005 0.1 0.3 0.1

trumpet :: Instrument
trumpet freq = base * hull
  where
    base = abs (modulatedSine freq (sine (2*freq)))
    hull = hullCurve 0.01 0.1 0 0.0001

fanfare =
  (
    (play bass (pattern2Notes fanfareSpeed fanfareBase)) +
    (play trumpet (pattern2Notes fanfareSpeed fanfareTrumpet1)) +
    (play trumpet (pattern2Notes fanfareSpeed fanfareTrumpet2)) +
    (play trumpet (pattern2Notes fanfareSpeed fanfareTrumpet3))
  ) / 4
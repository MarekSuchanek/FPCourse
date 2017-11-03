data Color = Black | White | RGB Int Int Int

badDescribeBW :: Color -> String
badDescribeBW c = case c of
       Black           -> "black"
       White           -> "white"

describeBW :: Color -> String
describeBW c = case c of
       Black           -> "black"
       White           -> "white"
       RGB 0 0 0       -> "black"
       RGB 255 255 255 -> "white"
       _               -> "unknown"  -- "default" match


ifThenElse :: Bool -> a -> a -> a
ifThenElse True  onTrue  _ = onTrue
ifThenElse False _ onFalse = onFalse

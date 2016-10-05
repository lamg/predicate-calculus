Predicate calculus
=====
The following functions are lifted versions of functions
with boolean domain.

> module Data.Bool.Predicates where
> import Data.Bool (bool)
> import Control.Applicative (liftA2, liftA3)

> lBool :: Applicative f => f d -> f d -> f Bool -> f d
> lBool = liftA3 bool

Functions lAnd and lOr are (&&) and (||) in predicate 
calculus.

> lAnd :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
> lAnd = liftA2 (&&)

> lOr :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
> lOr = liftA2 (||)
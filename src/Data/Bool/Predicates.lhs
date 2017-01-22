Predicate calculus
=====
The following functions are lifted versions of functions
with boolean domain.

> {-# LANGUAGE UnicodeSyntax #-}
> module Data.Bool.Predicates where
> import Control.Applicative (Applicative, liftA2, liftA3)

> lBool ∷ Applicative f ⇒ f d → f d → f Bool → f d
> lBool = liftA3 bool

Functions lAnd and lOr are (&&) and (||) in predicate 
calculus.

> lAnd ∷ (a → Bool) → (a → Bool) → (a → Bool)
> lAnd = liftA2 (∧)

> lOr ∷ (a → Bool) → (a → Bool) → (a → Bool)
> lOr = liftA2 (∨)

> bool ∷ a → a → Bool → a
> bool x y z = if z then x else y

Prescinding of unicode Prelude

> (∘) = (.)
> (∧) = (&&)
> (∨) = (||)

There is an interesting way of seeing things
as booleans.

> class Predicate p where
>   project ∷ p → Bool
>   chain ∷ p → (p → p) → p
>   chain x y = if project x then y x else x
>   {-# MINIMAL project #-}

> instance Predicate (Maybe a) where
>   project Nothing = False
>   project (Just _) = True

> instance Predicate (Either a b) where
>   project (Left _) = False
>   project (Right _) = True

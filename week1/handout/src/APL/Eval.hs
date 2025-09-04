module APL.Eval
  (Val(..), eval
  )
where

import APL.AST (Exp(..))

data Val
  = ValInt Integer
  deriving (Eq, Show)

eval :: Exp -> Val
eval (CstInt x) = ValInt x

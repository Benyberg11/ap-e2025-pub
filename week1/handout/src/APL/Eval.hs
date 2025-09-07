module APL.Eval
  (Val(..), eval
  )
where

import APL.AST (Exp(..))

type Error = String

data Val
  = ValInt Integer
  deriving (Eq, Show)

eval :: Exp -> Either Error Val

eval (CstInt x) = Right $ ValInt x

eval (Add e1 e2) =
  case (eval e1, eval e2) of
    (Right (ValInt x), Right (ValInt y)) -> Right (ValInt (x + y))
    (Left err, _) -> Left err
    (_, Left err) -> Left err

eval (Sub e1 e2) =
  case (eval e1, eval e2) of
    (Right (ValInt x), Right (ValInt y)) -> Right (ValInt (x - y))
    (Left err, _) -> Left err
    (_, Left err) -> Left err

eval (Mul e1 e2) =
  case (eval e1, eval e2) of
    (Right (ValInt x), Right (ValInt y)) -> Right (ValInt (x * y))
    (Left err, _) -> Left err
    (_, Left err) -> Left err

eval (Div e1 e2) =
  case (eval e1, eval e2) of
    (Right (ValInt _), Right (ValInt 0)) -> Left "Division by zero"
    (Right (ValInt x), Right (ValInt y)) -> Right (ValInt (x `div` y))
    (Left err, _) -> Left err
    (_, Left err) -> Left err

eval (Pow e1 e2) =
  case (eval e1, eval e2) of
    (Right (ValInt x), Right (ValInt y))
      | y < 0     -> Left "Negative exponent"
      | otherwise -> Right (ValInt (x ^ y))
    (Left err, _) -> Left err
    (_, Left err) -> Left err
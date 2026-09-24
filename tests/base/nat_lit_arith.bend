# A nat literal meets a match one constructor at a time (lit_step), so an
# operation base defines by recursion over the tower costs its value in steps:
# the checker ran the machine stack out reducing an equation between literal
# operands at 10^3 and up, Nat.div worst, since divmod's loop runs the dividend.
# It answers them directly now. The equations below are the test -- checking the
# file has to reduce them; main only carries the output the run must print.
import Base

law main:
  IO(Unit)

def check.mul() -> {Nat.mul(10000n, 10000n) == 100000000n : Nat}:
  {==}

def check.div() -> {Nat.div(100000000n, 10000n) == 10000n : Nat}:
  {==}

def check.mod() -> {Nat.mod(99999999n, 12345n) == 5499n : Nat}:
  {==}

def check.nested() -> {Nat.add(Nat.mul(8100n, 12345n), 5499n) == 99999999n : Nat}:
  {==}

def check.cmp() -> {Nat.cmp(1000000n, 999999n) == GT{} : Cmp}:
  {==}

def main():
  IO.print(Nat.show(Nat.add(1n, 1n)))

#|2

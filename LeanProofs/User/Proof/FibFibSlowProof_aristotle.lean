/-
This file was edited by Aristotle.

Lean version: leanprover/lean4:v4.24.0
Mathlib version: f897ebcf72cd16f89ab4577d0c826cd14afaafc7
This project request had uuid: d7adb91f-92b9-4fb4-8015-caf55e9f86dc

To cite Aristotle, tag @Aristotle-Harmonic on GitHub PRs/issues, and add as co-author to commits:
Co-authored-by: Aristotle (Harmonic) <aristotle-harmonic@harmonic.fun>

The following was proved by Aristotle:

- def FibFibSlow_proof : FibFibSlow
-/

import LeanProofs.Flux.Prelude
import LeanProofs.Flux.VC.FibFibSlow


namespace F

def FibFibSlow_proof : FibFibSlow := by
  unfold FibFibSlow
  -- By definition of $F.fib_fib$, we know that for $n > 1$, $F.fib_fib n = F.fib_fib (n - 1) + F.fib_fib (n - 2)$.
  have h_fib_fib : ∀ n : ℕ, n > 1 → F.fib_fib n = F.fib_fib (n - 1) + F.fib_fib (n - 2) := by
    -- By definition of $F.fib_fib$, for any $n > 1$, we have $F.fib_fib n = F.fib_fib (n - 1) + F.fib_fib (n - 2)$.
    intros n hn
    rw [F.fib_fib];
    exact if_neg ( by linarith );
  -- By definition of $F.fib_fib$, we know that for $n \leq 1$, $F.fib_fib n = 1$.
  have h_fib_fib_le_one : ∀ n : ℕ, n ≤ 1 → F.fib_fib n = 1 := by
    native_decide +revert;
  intro n₀ hn₀; rcases n₀ with ( _ | _ | n₀ ) <;> simp_all +decide ;
  exact fun h => ⟨ by linarith, fun _ => by linarith ⟩

end F
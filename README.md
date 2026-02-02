# Aristotle Issue

To reproduce:

```sh
$ git clone git@github.com:ranjitjhala/aristotle-debug.git
$ cd aristotle-debug
```

Now the following has a `sorry` which I asked `aristotle` to fill in

```sh
$ lake build LeanProofs/User/Proof/FibFibSlowProof.lean
⚠ [5/5] Replayed LeanProofs.User.Proof.FibFibSlowProof
warning: LeanProofs/User/Proof/FibFibSlowProof.lean:6:4: declaration uses 'sorry'
```

But I got back the result `FibFibSlowProof_aristotle.lean`
which doesn't compile

```sh
$ lake build LeanProofs/User/Proof/FibFibSlowProof_aristotle.lean
✖ [5/5] Building LeanProofs.User.Proof.FibFibSlowProof_aristotle
trace: .> LEAN_PATH=/Users/rjhala/research/aristotle-debug/.lake/build/lib/lean /Users/rjhala/.elan/toolchains/leanprover--lean4---v4.24.0/bin/lean /Users/rjhala/research/aristotle-debug/LeanProofs/User/Proof/FibFibSlowProof_aristotle.lean -o /Users/rjhala/research/aristotle-debug/.lake/build/lib/lean/LeanProofs/User/Proof/FibFibSlowProof_aristotle.olean -i /Users/rjhala/research/aristotle-debug/.lake/build/lib/lean/LeanProofs/User/Proof/FibFibSlowProof_aristotle.ilean -c /Users/rjhala/research/aristotle-debug/.lake/build/ir/LeanProofs/User/Proof/FibFibSlowProof_aristotle.c --setup /Users/rjhala/research/aristotle-debug/.lake/build/ir/LeanProofs/User/Proof/FibFibSlowProof_aristotle.setup.json --json
error: LeanProofs/User/Proof/FibFibSlowProof_aristotle.lean:29:23: unknown tactic
error: LeanProofs/User/Proof/FibFibSlowProof_aristotle.lean:25:25: Unknown identifier `ℕ`
error: LeanProofs/User/Proof/FibFibSlowProof_aristotle.lean:29:19: unsolved goals
n : sorry
hn : sorry
⊢ ¬?m.41
error: LeanProofs/User/Proof/FibFibSlowProof_aristotle.lean:22:37: unsolved goals
case refine_1
⊢ sorry → HSub sorry Nat Int

case refine_2
⊢ sorry → HSub sorry Nat Int

case refine_3
h_fib_fib : ∀ (n : sorry) (a : sorry), fib_fib sorry = fib_fib (n - 1) + fib_fib (n - 2)
⊢ ∀ (n₀ : Int),
    n₀ ≥ 0 →
      ((!decide (n₀ ≤ 1)) = true →
          n₀ - 1 ≥ 0 ∧
            (fib_fib (n₀ - 1) ≥ 0 →
              n₀ - 2 ≥ 0 ∧ (fib_fib (n₀ - 2) ≥ 0 → fib_fib (n₀ - 1) + fib_fib (n₀ - 2) = fib_fib n₀))) ∧
        (n₀ ≤ 1 → 1 = fib_fib n₀)
error: Lean exited with code 1
Some required targets logged failures:
- LeanProofs.User.Proof.FibFibSlowProof_aristotle
error: build failed
```

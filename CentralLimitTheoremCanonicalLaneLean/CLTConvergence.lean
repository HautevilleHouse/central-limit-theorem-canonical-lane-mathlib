import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CentralLimitTheoremCanonicalLaneLean.CharacteristicFunction

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure CLTConvergence {Ω : CLTProbabilitySpace} {X : IIDRandomVariables Ω} where
  normalizedSum : ℕ → (Ω.sampleSpace → ℝ) := λ n => (λ ω => (∑ i in Finset.range n, X.randomVariable i ω) / Real.sqrt n)
  limitDistribution : ℝ → ℝ := λ x => (1 / Real.sqrt (2 * π)) * Real.exp (-(x^2)/2)
  pointwiseConvergence : ∀ x : ℝ, ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N,
    |Ω.probabilityMeasure {ω | normalizedSum n ω ≤ x} - (∫ y in Set.Iic x, limitDistribution y)| < ε
  uniformConvergence : ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N,
    ∀ x : ℝ, |Ω.probabilityMeasure {ω | normalizedSum n ω ≤ x} - (∫ y in Set.Iic x, limitDistribution y)| < ε

structure CLTConvergenceEvidence {Ω : CLTProbabilitySpace} {X : IIDRandomVariables Ω}
    (C : CLTConvergence X) where
  pointwiseConvergenceClosed : C.pointwiseConvergence
  uniformConvergenceClosed : C.uniformConvergence

def CLTConvergenceClosed {Ω : CLTProbabilitySpace} {X : IIDRandomVariables Ω}
    (C : CLTConvergence X) : Prop :=
  C.pointwiseConvergence ∧ C.uniformConvergence

theorem clt_convergence_closed_from_evidence {Ω : CLTProbabilitySpace}
    {X : IIDRandomVariables Ω} (C : CLTConvergence X)
    (E : CLTConvergenceEvidence C) : CLTConvergenceClosed C := by
  exact And.intro E.pointwiseConvergenceClosed E.uniformConvergenceClosed

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse
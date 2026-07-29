import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CentralLimitTheoremCanonicalLaneLean.CLTProbabilitySpace

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure IIDRandomVariables (Ω : CLTProbabilitySpace) where
  randomVariable : ℕ → (Ω.sampleSpace → ℝ)
  measurable : ∀ n : ℕ, ∀ s : Set ℝ, measurableSet s →
    (randomVariable n)⁻¹' s ∈ Ω.sigmaAlgebra
  identicalDistribution : ∀ n m : ℕ, ∀ (B : Set ℝ), measurableSet B →
    Ω.probabilityMeasure ((randomVariable n)⁻¹' B) = Ω.probabilityMeasure ((randomVariable m)⁻¹' B)
  independence : ∀ (n : ℕ) (A : Set (Ω.sampleSpace → ℝ)), measurableSet A →
    Ω.probabilityMeasure ((randomVariable n)⁻¹' {x | x ∈ A}) = Ω.probabilityMeasure {x | (randomVariable n) x ∈ A}
  finiteMean : ∀ n : ℕ, ∃ (μ : ℝ), (∫ x in Ω.sampleSpace, (randomVariable n) x ∂Ω.probabilityMeasure) = μ
  finiteVariance : ∀ n : ℕ, ∃ (σ2 : ℝ), σ2 > 0 ∧ (∫ x in Ω.sampleSpace, ((randomVariable n) x - μ)^2 ∂Ω.probabilityMeasure) = σ2

structure IIDRandomVariablesEvidence {Ω : CLTProbabilitySpace} (X : IIDRandomVariables Ω) where
  measurableClosed : X.measurable
  identicalDistributionClosed : X.identicalDistribution
  independenceClosed : X.independence
  finiteMeanClosed : X.finiteMean
  finiteVarianceClosed : X.finiteVariance

def IIDRandomVariablesClosed {Ω : CLTProbabilitySpace} (X : IIDRandomVariables Ω) : Prop :=
  X.measurable ∧ X.identicalDistribution ∧ X.independence ∧ X.finiteMean ∧ X.finiteVariance

theorem iid_random_variables_closed_from_evidence {Ω : CLTProbabilitySpace}
    (X : IIDRandomVariables Ω) (E : IIDRandomVariablesEvidence X) :
    IIDRandomVariablesClosed X := by
  exact And.intro E.measurableClosed
    (And.intro E.identicalDistributionClosed
      (And.intro E.independenceClosed
        (And.intro E.finiteMeanClosed E.finiteVarianceClosed)))

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse
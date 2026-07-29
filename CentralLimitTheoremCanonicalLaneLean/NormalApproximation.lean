import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure NormalApproximationPackage (X : ℕ → Type) [∀ n, MeasurableSpace (X n)]
    (μ : ∀ n, Measure (X n)) where
  iidSequence : ∀ n, Vector (X n) n
  standardNormalTarget : Type := ℝ
  convergenceInDistribution : Prop
  errorBound : Prop
  berryEsseenConstant : ℝ := 0.4748

structure NormalApproximationEvidence {X : ℕ → Type} [∀ n, MeasurableSpace (X n)]
    {μ : ∀ n, Measure (X n)} (N : NormalApproximationPackage X μ) where
  convergenceInDistributionClosed : N.convergenceInDistribution
  errorBoundClosed : N.errorBound

def NormalApproximationClosed {X : ℕ → Type} [∀ n, MeasurableSpace (X n)]
    {μ : ∀ n, Measure (X n)} (N : NormalApproximationPackage X μ) : Prop :=
  N.convergenceInDistribution ∧ N.errorBound

theorem normal_approximation_closed_from_evidence
    {X : ℕ → Type} [∀ n, MeasurableSpace (X n)] {μ : ∀ n, Measure (X n)}
    (N : NormalApproximationPackage X μ) (E : NormalApproximationEvidence N) :
    NormalApproximationClosed N := by
  exact And.intro E.convergenceInDistributionClosed E.errorBoundClosed

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse

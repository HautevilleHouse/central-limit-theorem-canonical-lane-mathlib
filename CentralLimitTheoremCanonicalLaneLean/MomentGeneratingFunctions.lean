import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure MomentGeneratingFunctionPackage (X : Type) [MeasurableSpace X] (μ : Measure X) where
  mgfDefined : ℝ → ℝ := λ t => ∫ x, exp (t * x) ∂μ
  finiteForSomeInterval : Prop
  differentiabilityAtZero : Prop
  cumulantGeneratingFunction : ℝ → ℝ := λ t => log (mgfDefined t)

structure MomentGeneratingFunctionEvidence {X : Type} [MeasurableSpace X] {μ : Measure X}
    (M : MomentGeneratingFunctionPackage X μ) where
  finiteForSomeIntervalClosed : M.finiteForSomeInterval
  differentiabilityAtZeroClosed : M.differentiabilityAtZero

def MomentGeneratingFunctionClosed {X : Type} [MeasurableSpace X] {μ : Measure X}
    (M : MomentGeneratingFunctionPackage X μ) : Prop :=
  M.finiteForSomeInterval ∧ M.differentiabilityAtZero

theorem moment_generating_function_closed_from_evidence
    {X : Type} [MeasurableSpace X] {μ : Measure X}
    (M : MomentGeneratingFunctionPackage X μ) (E : MomentGeneratingFunctionEvidence M) :
    MomentGeneratingFunctionClosed M := by
  exact And.intro E.finiteForSomeIntervalClosed E.differentiabilityAtZeroClosed

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse

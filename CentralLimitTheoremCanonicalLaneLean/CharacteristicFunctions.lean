import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure CharacteristicFunctionPackage where
  randomVariable : Type u → ℝ
  distribution : Type v
  characteristicFunction : Type w → ℂ
  pointwiseConvergence : Prop
  continuityAtZero : Prop
  differentiabilityAtZero : Prop

structure CharacteristicFunctionEvidence (C : CharacteristicFunctionPackage) where
  pointwiseConvergenceClosed : C.pointwiseConvergence
  continuityAtZeroClosed : C.continuityAtZero
  differentiabilityAtZeroClosed : C.differentiabilityAtZero

def CharacteristicFunctionClosed (C : CharacteristicFunctionPackage) : Prop :=
  C.pointwiseConvergence ∧ C.continuityAtZero ∧ C.differentiabilityAtZero

theorem characteristic_function_closed_from_evidence (C : CharacteristicFunctionPackage)
    (E : CharacteristicFunctionEvidence C) : CharacteristicFunctionClosed C := by
  exact And.intro E.pointwiseConvergenceClosed
    (And.intro E.continuityAtZeroClosed E.differentiabilityAtZeroClosed)

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure CharacteristicFunctionPackage where
  distributionType : Type u
  characteristicFunction : Type v
  levyContinuity : Prop
  taylorExpansion : Prop
  convergenceInLaw : Prop

structure CharacteristicFunctionEvidence (C : CharacteristicFunctionPackage) where
  levyContinuityClosed : C.levyContinuity
  taylorExpansionClosed : C.taylorExpansion
  convergenceInLawClosed : C.convergenceInLaw

def CharacteristicFunctionClosed (C : CharacteristicFunctionPackage) : Prop :=
  C.levyContinuity ∧ C.taylorExpansion ∧ C.convergenceInLaw

theorem characteristic_function_closed_from_evidence
    (C : CharacteristicFunctionPackage) (E : CharacteristicFunctionEvidence C) :
    CharacteristicFunctionClosed C := by
  exact And.intro E.levyContinuityClosed
    (And.intro E.taylorExpansionClosed E.convergenceInLawClosed)

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse
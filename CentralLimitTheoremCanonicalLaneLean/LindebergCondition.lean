import CentralLimitTheoremCanonicalLaneLean.CharacteristicFunction

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure LindebergConditionPackage {P : ProbabilitySpacePackage}
    (C : CharacteristicFunctionPackage P) where
  triangularArray : Type u
  rowIndependent : Prop
  finiteVariance : Prop
  lindebergConditionHolds : Prop
  arraySumDefined : Prop

structure LindebergConditionEvidence {P : ProbabilitySpacePackage}
    {C : CharacteristicFunctionPackage P} (L : LindebergConditionPackage C) where
  rowIndependentClosed : L.rowIndependent
  finiteVarianceClosed : L.finiteVariance
  lindebergConditionHoldsClosed : L.lindebergConditionHolds
  arraySumDefinedClosed : L.arraySumDefined

def LindebergConditionClosed {P : ProbabilitySpacePackage}
    {C : CharacteristicFunctionPackage P} (L : LindebergConditionPackage C) : Prop :=
  L.rowIndependent ∧ L.finiteVariance ∧ L.lindebergConditionHolds ∧ L.arraySumDefined

theorem lindeberg_condition_closed_from_evidence
    {P : ProbabilitySpacePackage} {C : CharacteristicFunctionPackage P}
    (L : LindebergConditionPackage C) (E : LindebergConditionEvidence L) :
    LindebergConditionClosed L := by
  exact And.intro E.rowIndependentClosed
    (And.intro E.finiteVarianceClosed
      (And.intro E.lindebergConditionHoldsClosed E.arraySumDefinedClosed))

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse

import CentralLimitTheoremCanonicalLaneLean.LindebergCondition

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure ConvergenceResultsPackage {P : ProbabilitySpacePackage}
    {C : CharacteristicFunctionPackage P} (L : LindebergConditionPackage C) where
  weakConvergence : Prop
  normalLimitIdentified : Prop
  rateOfConvergence : Prop

structure ConvergenceResultsEvidence {P : ProbabilitySpacePackage}
    {C : CharacteristicFunctionPackage P} {L : LindebergConditionPackage C}
    (R : ConvergenceResultsPackage L) where
  weakConvergenceClosed : R.weakConvergence
  normalLimitIdentifiedClosed : R.normalLimitIdentified
  rateOfConvergenceClosed : R.rateOfConvergence

def ConvergenceResultsClosed {P : ProbabilitySpacePackage}
    {C : CharacteristicFunctionPackage P} {L : LindebergConditionPackage C}
    (R : ConvergenceResultsPackage L) : Prop :=
  R.weakConvergence ∧ R.normalLimitIdentified ∧ R.rateOfConvergence

theorem convergence_results_closed_from_evidence
    {P : ProbabilitySpacePackage} {C : CharacteristicFunctionPackage P}
    {L : LindebergConditionPackage C} (R : ConvergenceResultsPackage L)
    (E : ConvergenceResultsEvidence R) : ConvergenceResultsClosed R := by
  exact And.intro E.weakConvergenceClosed
    (And.intro E.normalLimitIdentifiedClosed E.rateOfConvergenceClosed)

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse

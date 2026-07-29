import CentralLimitTheoremCanonicalLaneLean.ProbabilitySpace

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure CharacteristicFunctionPackage (P : ProbabilitySpacePackage) where
  domain : Type u
  domainTopology : TopologicalSpace domain
  measure : domain → ℝ
  characteristicFunction : (domain → ℝ) → ℂ
  convergenceDomain : Prop
  continuityAtZero : Prop
  uniquenessTheorem : Prop

structure CharacteristicFunctionEvidence {P : ProbabilitySpacePackage} (C : CharacteristicFunctionPackage P) where
  convergenceDomainClosed : C.convergenceDomain
  continuityAtZeroClosed : C.continuityAtZero
  uniquenessTheoremClosed : C.uniquenessTheorem

def CharacteristicFunctionClosed {P : ProbabilitySpacePackage} (C : CharacteristicFunctionPackage P) : Prop :=
  C.convergenceDomain ∧ C.continuityAtZero ∧ C.uniquenessTheorem

theorem characteristic_function_closed_from_evidence
    {P : ProbabilitySpacePackage} (C : CharacteristicFunctionPackage P)
    (E : CharacteristicFunctionEvidence C) : CharacteristicFunctionClosed C := by
  exact And.intro E.convergenceDomainClosed
    (And.intro E.continuityAtZeroClosed E.uniquenessTheoremClosed)

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse

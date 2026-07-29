import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure ConvergenceInDistributionPackage where
  sequenceOfDistributions : ℕ → Type u
  limitDistribution : Type u
  weakConvergence : Prop
  continuousBoundedFunctionsSeparating : Prop
  portmanteauConditions : Prop

structure ConvergenceInDistributionEvidence (C : ConvergenceInDistributionPackage) where
  weakConvergenceClosed : C.weakConvergence
  continuousBoundedFunctionsSeparatingClosed : C.continuousBoundedFunctionsSeparating
  portmanteauConditionsClosed : C.portmanteauConditions

def ConvergenceInDistributionClosed (C : ConvergenceInDistributionPackage) : Prop :=
  C.weakConvergence ∧ C.continuousBoundedFunctionsSeparating ∧ C.portmanteauConditions

theorem convergence_in_distribution_closed_from_evidence (C : ConvergenceInDistributionPackage)
    (E : ConvergenceInDistributionEvidence C) : ConvergenceInDistributionClosed C := by
  exact And.intro E.weakConvergenceClosed
    (And.intro E.continuousBoundedFunctionsSeparatingClosed E.portmanteauConditionsClosed)

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse

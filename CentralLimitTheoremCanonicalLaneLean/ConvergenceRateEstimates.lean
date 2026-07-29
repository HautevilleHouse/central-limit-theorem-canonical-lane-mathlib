import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure ConvergenceRateEstimatesPackage where
  distributionSum : Type u
  normalizedSum : Type v
  berryEsseenBound : Prop
  edgeworthExpansion : Prop
  uniformityClass : Prop

structure ConvergenceRateEstimatesEvidence (P : ConvergenceRateEstimatesPackage) where
  berryEsseenBoundClosed : P.berryEsseenBound
  edgeworthExpansionClosed : P.edgeworthExpansion
  uniformityClassClosed : P.uniformityClass

def ConvergenceRateEstimatesClosed (P : ConvergenceRateEstimatesPackage) : Prop :=
  P.berryEsseenBound ∧ P.edgeworthExpansion ∧ P.uniformityClass

theorem convergence_rate_estimates_closed_from_evidence
    (P : ConvergenceRateEstimatesPackage) (E : ConvergenceRateEstimatesEvidence P) :
    ConvergenceRateEstimatesClosed P := by
  exact And.intro E.berryEsseenBoundClosed
    (And.intro E.edgeworthExpansionClosed E.uniformityClassClosed)

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse
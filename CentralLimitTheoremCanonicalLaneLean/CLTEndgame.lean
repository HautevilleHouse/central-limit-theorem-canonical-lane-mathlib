import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CentralLimitTheoremCanonicalLaneLean.CLTConvergence

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure CLTAdmissibleObject where
  probabilitySpace : CLTProbabilitySpace
  iidVariables : IIDRandomVariables probabilitySpace
  characteristicFunction : CharacteristicFunction iidVariables
  convergence : CLTConvergence iidVariables
  convergenceEvidence : CLTConvergenceEvidence convergence

def constrainedCLTClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_clt_endgame (A : AdmissibleClass) :
    constrainedCLTClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse
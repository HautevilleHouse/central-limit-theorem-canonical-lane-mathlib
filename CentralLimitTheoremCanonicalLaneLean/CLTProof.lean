import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CentralLimitTheoremCanonicalLaneLean.Independence
import HautevilleHouse.CentralLimitTheoremCanonicalLaneLean.MomentGeneratingFunctions
import HautevilleHouse.CentralLimitTheoremCanonicalLaneLean.CharacteristicFunctions
import HautevilleHouse.CentralLimitTheoremCanonicalLaneLean.ConvergenceInDistribution

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure CLTProofPackage where
  normalizedSum : Type u
  standardNormalDistribution : Type v
  mgfConvergence : Prop
  charFuncConvergence : Prop
  conclusion : Prop

structure CLTProofEvidence (C : CLTProofPackage) where
  mgfConvergenceClosed : C.mgfConvergence
  charFuncConvergenceClosed : C.charFuncConvergence
  conclusionClosed : C.conclusion

def CLTProofClosed (C : CLTProofPackage) : Prop :=
  C.mgfConvergence ∧ C.charFuncConvergence ∧ C.conclusion

theorem clt_proof_closed_from_evidence (C : CLTProofPackage) (E : CLTProofEvidence C) : CLTProofClosed C := by
  exact And.intro E.mgfConvergenceClosed (And.intro E.charFuncConvergenceClosed E.conclusionClosed)

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse
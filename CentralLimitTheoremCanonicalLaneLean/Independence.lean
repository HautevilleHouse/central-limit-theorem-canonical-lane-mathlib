import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure IndependencePackage where
  randomVariableSpace : Type u
  sigmaAlgebra : Type v
  independenceCondition : Prop
  productMeasure : Prop
  zeroCovarianceImpliesIndependence : Prop

structure IndependenceEvidence (I : IndependencePackage) where
  independenceConditionClosed : I.independenceCondition
  productMeasureClosed : I.productMeasure
  zeroCovarianceImpliesIndependenceClosed : I.zeroCovarianceImpliesIndependence

def IndependenceClosed (I : IndependencePackage) : Prop :=
  I.independenceCondition ∧ I.productMeasure ∧ I.zeroCovarianceImpliesIndependence

theorem independence_closed_from_evidence (I : IndependencePackage) (E : IndependenceEvidence I) : IndependenceClosed I := by
  exact And.intro E.independenceConditionClosed (And.intro E.productMeasureClosed E.zeroCovarianceImpliesIndependenceClosed)

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse
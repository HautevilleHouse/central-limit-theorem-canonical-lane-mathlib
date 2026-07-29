import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure IndependentSummandsPackage where
  sampleSpace : Type u
  probabilityMeasure : Type v
  indexSet : Type w
  randomVariables : indexSet → (sampleSpace → ℝ)
  independenceCondition : Prop
  identicallyDistributedCondition : Prop
  finiteVarianceCondition : Prop

structure IndependentSummandsEvidence (I : IndependentSummandsPackage) where
  independenceConditionClosed : I.independenceCondition
  identicallyDistributedConditionClosed : I.identicallyDistributedCondition
  finiteVarianceConditionClosed : I.finiteVarianceCondition

def IndependentSummandsClosed (I : IndependentSummandsPackage) : Prop :=
  I.independenceCondition ∧ I.identicallyDistributedCondition ∧ I.finiteVarianceCondition

theorem independent_summands_closed_from_evidence (I : IndependentSummandsPackage)
    (E : IndependentSummandsEvidence I) : IndependentSummandsClosed I := by
  exact And.intro E.independenceConditionClosed
    (And.intro E.identicallyDistributedConditionClosed E.finiteVarianceConditionClosed)

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse

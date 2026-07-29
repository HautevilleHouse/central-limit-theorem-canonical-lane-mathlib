import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure CLTProbabilitySpace where
  sampleSpace : Type u
  sigmaAlgebra : Set (Set sampleSpace)
  probabilityMeasure : Set sampleSpace → ℝ
  sigmaAlgebraClosedUnderComplements : Prop
  sigmaAlgebraClosedUnderCountableUnions : Prop
  probabilityMeasureNonnegative : Prop
  probabilityMeasureTotal : probabilityMeasure (Set.univ) = 1
  probabilityMeasureCountablyAdditive : Prop

structure CLTProbabilitySpaceEvidence (Ω : CLTProbabilitySpace) where
  sigmaAlgebraClosedUnderComplementsClosed : Ω.sigmaAlgebraClosedUnderComplements
  sigmaAlgebraClosedUnderCountableUnionsClosed : Ω.sigmaAlgebraClosedUnderCountableUnions
  probabilityMeasureNonnegativeClosed : Ω.probabilityMeasureNonnegative
  probabilityMeasureCountablyAdditiveClosed : Ω.probabilityMeasureCountablyAdditive

def CLTProbabilitySpaceClosed (Ω : CLTProbabilitySpace) : Prop :=
  Ω.sigmaAlgebraClosedUnderComplements ∧ Ω.sigmaAlgebraClosedUnderCountableUnions ∧
  Ω.probabilityMeasureNonnegative ∧ Ω.probabilityMeasureCountablyAdditive

theorem clt_probability_space_closed_from_evidence (Ω : CLTProbabilitySpace)
    (E : CLTProbabilitySpaceEvidence Ω) : CLTProbabilitySpaceClosed Ω := by
  exact And.intro E.sigmaAlgebraClosedUnderComplementsClosed
    (And.intro E.sigmaAlgebraClosedUnderCountableUnionsClosed
      (And.intro E.probabilityMeasureNonnegativeClosed E.probabilityMeasureCountablyAdditiveClosed))

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse
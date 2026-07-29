import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure RandomVariable where
  carrier : Type u
  measurableSpace : MeasurableSpace carrier
  distribution : MeasureTheory.Measure carrier
  expectation : (carrier → ℝ) → ℝ
  variance : (carrier → ℝ) → ℝ
  finiteExpectation : Prop
  finiteVariance : Prop

structure ProbabilitySpacePackage where
  sampleSpace : Type u
  sampleSpaceTopology : TopologicalSpace sampleSpace
  sigmaAlgebra : MeasurableSpace sampleSpace
  probabilityMeasure : MeasureTheory.Measure sampleSpace
  randomVariable : RandomVariable
  iidCopies : ℕ → RandomVariable
  iidProperty : Prop

structure ProbabilitySpaceEvidence (P : ProbabilitySpacePackage) where
  iidPropertyClosed : P.iidProperty
  finiteExpectationClosed : P.randomVariable.finiteExpectation
  finiteVarianceClosed : P.randomVariable.finiteVariance

def ProbabilitySpaceClosed (P : ProbabilitySpacePackage) : Prop :=
  P.iidProperty ∧ P.randomVariable.finiteExpectation ∧ P.randomVariable.finiteVariance

theorem probability_space_closed_from_evidence
    (P : ProbabilitySpacePackage) (E : ProbabilitySpaceEvidence P) :
    ProbabilitySpaceClosed P := by
  exact And.intro E.iidPropertyClosed
    (And.intro E.finiteExpectationClosed E.finiteVarianceClosed)

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse

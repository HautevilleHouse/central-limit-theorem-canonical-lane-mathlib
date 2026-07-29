import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

structure CLTAdmittedObject where
  space : Type
  probabilitySpace : Prop
  independentIdenticallyDistributed : Prop
  finiteVariance : Prop
  normalizedSum : Type
  convergenceInDistribution : Prop
  conclusion : convergenceInDistribution

def CLTWitnessClosed (O : CLTAdmittedObject) : Prop :=
  O.convergenceInDistribution

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse
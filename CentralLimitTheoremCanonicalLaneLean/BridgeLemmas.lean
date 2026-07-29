import CentralLimitTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CentralLimitTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CentralLimitWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CentralLimitTheoremCanonicalLaneLean
end HautevilleHouse

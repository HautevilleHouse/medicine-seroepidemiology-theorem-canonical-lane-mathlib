import MedicineSeroepidemiologyTheoremCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace MedicineSeroepidemiologyTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SeroepidemiologyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MedicineSeroepidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
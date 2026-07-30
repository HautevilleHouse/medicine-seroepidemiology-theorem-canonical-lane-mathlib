import MedicineSeroepidemiologyTheoremCanonicalLaneLean.TheoremStatement
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyTheoremCanonicalLaneLean

structure SeroepidemiologySpace where
  population : Type
  timePoints : Type

structure SeroepidemiologyAdmittedObject where
  space : SeroepidemiologySpace
  seroprevalenceData : Prop
  transmissionModel : Prop
  immunityAssumption : Prop
  conclusion : Prop

structure SeroepidemiologyEndgameState where
  object : SeroepidemiologyAdmittedObject

def SeroepidemiologyWitnessClosed (O : SeroepidemiologyAdmittedObject) : Prop :=
  O.conclusion

end MedicineSeroepidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass
import MedicineSeroepidemiologyTheoremCanonicalLaneLean.CompartmentModel
import MedicineSeroepidemiologyTheoremCanonicalLaneLean.DiagnosticInference
import MedicineSeroepidemiologyTheoremCanonicalLaneLean.SurvivalAnalysis

namespace HautevilleHouse
namespace MedicineSeroepidemiologyTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.endpointSatisfied

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedSeroepidemiologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_seroepidemiology_endgame (A : AdmissibleClass) :
    ConstrainedSeroepidemiologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MedicineSeroepidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
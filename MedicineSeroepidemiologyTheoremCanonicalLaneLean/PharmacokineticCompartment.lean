import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyTheoremCanonicalLaneLean

structure PharmacokineticCompartment where
  ivRoute : ℝ → ℝ
  oralRoute : ℝ → ℝ
  absorptionRate : ℝ
  eliminationRate : ℝ
  volumeOfDistribution : ℝ
  concCurve : ℝ → ℝ
  absorptionDefined : Prop
  eliminationDefined : Prop
  volumeDefined : Prop
  concCurveDefined : Prop

structure PharmacokineticEvidence (P : PharmacokineticCompartment) where
  absorptionClosed : P.absorptionDefined
  eliminationClosed : P.eliminationDefined
  volumeClosed : P.volumeDefined
  concCurveClosed : P.concCurveDefined

def PharmacokineticClosed (P : PharmacokineticCompartment) : Prop :=
  P.absorptionDefined ∧ P.eliminationDefined ∧ P.volumeDefined ∧ P.concCurveDefined

theorem pharmacokinetic_closed_from_evidence
    (P : PharmacokineticCompartment) (E : PharmacokineticEvidence P) :
    PharmacokineticClosed P := by
  exact And.intro E.absorptionClosed (And.intro E.eliminationClosed (And.intro E.volumeClosed E.concCurveClosed))

end MedicineSeroepidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
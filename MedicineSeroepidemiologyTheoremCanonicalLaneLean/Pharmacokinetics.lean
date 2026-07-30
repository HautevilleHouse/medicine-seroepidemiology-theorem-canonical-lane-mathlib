import MedicineSeroepidemiologyTheoremCanonicalLaneLean.SingularityModels

namespace HautevilleHouse
namespace MedicineSeroepidemiologyTheoremCanonicalLaneLean

structure PharmacokineticsPackage (Q : SingularityModelsPackage) where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  doseResponse : Prop
  bioequivalence : Prop

structure PharmacokineticsEvidence
    (P : PharmacokineticsPackage) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  doseResponseClosed : P.doseResponse
  bioequivalenceClosed : P.bioequivalence

def PharmacokineticsClosed (P : PharmacokineticsPackage) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧ P.doseResponse ∧ P.bioequivalence

theorem pharmacokinetics_closed_from_evidence
    (P : PharmacokineticsPackage) (E : PharmacokineticsEvidence P) :
    PharmacokineticsClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.doseResponseClosed E.bioequivalenceClosed)))

end MedicineSeroepidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
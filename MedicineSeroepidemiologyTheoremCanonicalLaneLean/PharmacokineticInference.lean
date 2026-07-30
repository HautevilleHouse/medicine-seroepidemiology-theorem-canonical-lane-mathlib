import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyTheoremCanonicalLaneLean

structure PharmacokineticInferencePackage where
  drugDistribution : Prop
  absorptionRate : Prop
  eliminationRate : Prop
  compartmentVolumes : Prop
  bioavailableFraction : Prop
  clearanceModel : Prop
  steadyStateCondition : Prop

structure PharmacokineticInferenceEvidence (P : PharmacokineticInferencePackage) where
  drugDistributionClosed : P.drugDistribution
  absorptionRateClosed : P.absorptionRate
  eliminationRateClosed : P.eliminationRate
  compartmentVolumesClosed : P.compartmentVolumes
  bioavailableFractionClosed : P.bioavailableFraction
  clearanceModelClosed : P.clearanceModel
  steadyStateConditionClosed : P.steadyStateCondition

def PharmacokineticInferenceClosed (P : PharmacokineticInferencePackage) : Prop :=
  P.drugDistribution ∧ P.absorptionRate ∧ P.eliminationRate ∧ P.compartmentVolumes ∧
  P.bioavailableFraction ∧ P.clearanceModel ∧ P.steadyStateCondition

theorem pharmacokinetic_inference_closed_from_evidence (P : PharmacokineticInferencePackage)
    (E : PharmacokineticInferenceEvidence P) : PharmacokineticInferenceClosed P := by
  exact And.intro E.drugDistributionClosed
    (And.intro E.absorptionRateClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.compartmentVolumesClosed
          (And.intro E.bioavailableFractionClosed
            (And.intro E.clearanceModelClosed E.steadyStateConditionClosed)))))

end MedicineSeroepidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyTheoremCanonicalLaneLean

structure SeroepidemiologyPackage where
  seroprevalence : ℝ
  incidenceRate : ℝ
  transmissionProbability : ℝ
  populationImmunityThreshold : ℝ
  r0 : ℝ
  effectiveReproductionNumber : ℝ
  herdImmunityReached : Prop

structure SeroepidemiologyEvidence (S : SeroepidemiologyPackage) where
  seroprevalenceClosed : S.seroprevalence ∈ Ioo 0 1
  incidenceRateClosed : S.incidenceRate ≥ 0
  transmissionProbabilityClosed : S.transmissionProbability ∈ Ioo 0 1
  populationImmunityThresholdClosed : S.populationImmunityThreshold = 1 - 1 / S.r0
  r0Closed : S.r0 > 1
  effectiveReproductionNumberDerived : S.effectiveReproductionNumber = S.r0 * (1 - S.seroprevalence)
  herdImmunityReachedClosed : S.herdImmunityReached ↔ S.seroprevalence ≥ S.populationImmunityThreshold

def SeroepidemiologyClosed (S : SeroepidemiologyPackage) : Prop :=
  S.seroprevalence ∈ Ioo 0 1 ∧ S.incidenceRate ≥ 0 ∧ S.transmissionProbability ∈ Ioo 0 1 ∧
  S.populationImmunityThreshold = 1 - 1 / S.r0 ∧ S.r0 > 1 ∧
  S.effectiveReproductionNumber = S.r0 * (1 - S.seroprevalence) ∧
  (S.herdImmunityReached ↔ S.seroprevalence ≥ S.populationImmunityThreshold)

theorem seroepidemiology_closed_from_evidence (S : SeroepidemiologyPackage)
    (E : SeroepidemiologyEvidence S) : SeroepidemiologyClosed S := by
  exact And.intro E.seroprevalenceClosed
    (And.intro E.incidenceRateClosed
      (And.intro E.transmissionProbabilityClosed
        (And.intro E.populationImmunityThresholdClosed
          (And.intro E.r0Closed
            (And.intro E.effectiveReproductionNumberDerived
              (And.intro E.herdImmunityReachedClosed True.intro))))))

end MedicineSeroepidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
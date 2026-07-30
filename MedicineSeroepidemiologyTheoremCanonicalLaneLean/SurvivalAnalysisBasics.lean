import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyTheoremCanonicalLaneLean

structure SurvivalAnalysisBasicsPackage where
  survivalFunction : Prop
  hazardFunction : Prop
  censoringMechanism : Prop
  kaplanMeierEstimator : Prop
  coxProportionalHazards : Prop
  logRankTest : Prop
  cumulativeIncidence : Prop

structure SurvivalAnalysisBasicsEvidence (S : SurvivalAnalysisBasicsPackage) where
  survivalFunctionClosed : S.survivalFunction
  hazardFunctionClosed : S.hazardFunction
  censoringMechanismClosed : S.censoringMechanism
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  coxProportionalHazardsClosed : S.coxProportionalHazards
  logRankTestClosed : S.logRankTest
  cumulativeIncidenceClosed : S.cumulativeIncidence

def SurvivalAnalysisBasicsClosed (S : SurvivalAnalysisBasicsPackage) : Prop :=
  S.survivalFunction ∧ S.hazardFunction ∧ S.censoringMechanism ∧ S.kaplanMeierEstimator ∧
  S.coxProportionalHazards ∧ S.logRankTest ∧ S.cumulativeIncidence

theorem survival_analysis_basics_closed_from_evidence (S : SurvivalAnalysisBasicsPackage)
    (E : SurvivalAnalysisBasicsEvidence S) : SurvivalAnalysisBasicsClosed S := by
  exact And.intro E.survivalFunctionClosed
    (And.intro E.hazardFunctionClosed
      (And.intro E.censoringMechanismClosed
        (And.intro E.kaplanMeierEstimatorClosed
          (And.intro E.coxProportionalHazardsClosed
            (And.intro E.logRankTestClosed E.cumulativeIncidenceClosed)))))

end MedicineSeroepidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
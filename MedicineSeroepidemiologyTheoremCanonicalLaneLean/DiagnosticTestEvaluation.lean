import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyTheoremCanonicalLaneLean

structure DiagnosticTestEvaluationPackage where
  sensitivity : Prop
  specificity : Prop
  prevalence : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  rocCurve : Prop
  cutoffThreshold : Prop

structure DiagnosticTestEvaluationEvidence (D : DiagnosticTestEvaluationPackage) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  prevalenceClosed : D.prevalence
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  rocCurveClosed : D.rocCurve
  cutoffThresholdClosed : D.cutoffThreshold

def DiagnosticTestEvaluationClosed (D : DiagnosticTestEvaluationPackage) : Prop :=
  D.sensitivity ∧ D.specificity ∧ D.prevalence ∧ D.positivePredictiveValue ∧
  D.negativePredictiveValue ∧ D.rocCurve ∧ D.cutoffThreshold

theorem diagnostic_test_evaluation_closed_from_evidence (D : DiagnosticTestEvaluationPackage)
    (E : DiagnosticTestEvaluationEvidence D) : DiagnosticTestEvaluationClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.prevalenceClosed
        (And.intro E.positivePredictiveValueClosed
          (And.intro E.negativePredictiveValueClosed
            (And.intro E.rocCurveClosed E.cutoffThresholdClosed)))))

end MedicineSeroepidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
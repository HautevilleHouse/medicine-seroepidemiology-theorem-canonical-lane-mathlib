import MedicineSeroepidemiologyTheoremCanonicalLaneLean.RiemannianCurvature

namespace HautevilleHouse
namespace MedicineSeroepidemiologyTheoremCanonicalLaneLean

structure CompartmentModelsPackage (G : RiemannianCurvaturePackage) where
  susceptible : Type u
  exposed : Type v
  infected : Type w
  recovered : Type x
  flowEquations : Prop
  conservationLaw : Prop
  initialConditions : Prop
  parameterEstimates : Prop

structure CompartmentModelsEvidence {G : RiemannianCurvaturePackage}
    (C : CompartmentModelsPackage G) where
  flowEquationsClosed : C.flowEquations
  conservationLawClosed : C.conservationLaw
  initialConditionsClosed : C.initialConditions
  parameterEstimatesClosed : C.parameterEstimates

def CompartmentModelsClosed {G : RiemannianCurvaturePackage}
    (C : CompartmentModelsPackage G) : Prop :=
  C.flowEquations ∧ C.conservationLaw ∧ C.initialConditions ∧ C.parameterEstimates

theorem compartment_models_closed_from_evidence
    {G : RiemannianCurvaturePackage} (C : CompartmentModelsPackage G)
    (E : CompartmentModelsEvidence C) : CompartmentModelsClosed C := by
  exact And.intro E.flowEquationsClosed
    (And.intro E.conservationLawClosed
      (And.intro E.initialConditionsClosed E.parameterEstimatesClosed))

end MedicineSeroepidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
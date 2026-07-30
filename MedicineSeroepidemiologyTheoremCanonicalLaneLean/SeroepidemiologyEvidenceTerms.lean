import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyTheoremCanonicalLaneLean

structure SeroepidemiologyEvidenceTerms {M : SeroepidemiologyCompartmentModel}
    {P : PharmacokineticCompartment} {D : DiagnosticTest} {S : SurvivalData}
    (modelEv : SeroepidemiologyModelEvidence M)
    (pharmaEv : PharmacokineticEvidence P)
    (diagEv : DiagnosticEvidence D)
    (survEv : SurvivalEvidence S) where
  modelClosed : SeroepidemiologyModelClosed M := seroepidemiology_model_closed_from_evidence M modelEv
  pharmaClosed : PharmacokineticClosed P := pharmacokinetic_closed_from_evidence P pharmaEv
  diagClosed : DiagnosticInferenceClosed D := diagnostic_inference_closed_from_evidence D diagEv
  survClosed : SurvivalAnalysisClosed S := survival_analysis_closed_from_evidence S survEv

def SeroepidemiologyAllClosed {M : SeroepidemiologyCompartmentModel}
    {P : PharmacokineticCompartment} {D : DiagnosticTest} {S : SurvivalData}
    (E : SeroepidemiologyEvidenceTerms M P D S) : Prop :=
  SeroepidemiologyModelClosed M ∧ PharmacokineticClosed P ∧ DiagnosticInferenceClosed D ∧ SurvivalAnalysisClosed S

theorem seroepidemiology_all_closed_from_terms
    {M : SeroepidemiologyCompartmentModel} {P : PharmacokineticCompartment}
    {D : DiagnosticTest} {S : SurvivalData}
    (E : SeroepidemiologyEvidenceTerms M P D S) : SeroepidemiologyAllClosed E := by
  exact And.intro E.modelClosed (And.intro E.pharmaClosed (And.intro E.diagClosed E.survClosed))

end MedicineSeroepidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
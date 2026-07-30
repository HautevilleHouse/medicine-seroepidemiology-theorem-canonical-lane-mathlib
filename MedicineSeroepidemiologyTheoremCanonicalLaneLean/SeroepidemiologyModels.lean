import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyTheoremCanonicalLaneLean

structure SeroepidemiologyCompartmentModel where
  susceptible : Type
  infected : Type
  recovered : Type
  populationSize : ℕ
  transmissionRate : ℝ
  recoveryRate : ℝ
  birthRate : ℝ
  mortalityRate : ℝ
  modelEquationsDefined : Prop

structure SeroepidemiologyModelEvidence (M : SeroepidemiologyCompartmentModel) where
  modelEquationsDefinedClosed : M.modelEquationsDefined

def SeroepidemiologyModelClosed (M : SeroepidemiologyCompartmentModel) : Prop :=
  M.modelEquationsDefined

theorem seroepidemiology_model_closed_from_evidence
    (M : SeroepidemiologyCompartmentModel) (E : SeroepidemiologyModelEvidence M) :
    SeroepidemiologyModelClosed M := by
  exact E.modelEquationsDefinedClosed

end MedicineSeroepidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
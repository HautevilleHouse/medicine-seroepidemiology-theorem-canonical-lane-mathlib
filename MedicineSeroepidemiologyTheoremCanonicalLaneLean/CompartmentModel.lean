import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyTheoremCanonicalLaneLean

structure CompartmentModel where
  susceptible : Type u
  infected : Type v
  removed : Type w
  transmissionRate : Prop
  recoveryRate : Prop
  populationClosed : Prop

structure CompartmentModelEvidence (C : CompartmentModel) where
  transmissionRateClosed : C.transmissionRate
  recoveryRateClosed : C.recoveryRate
  populationClosedClosed : C.populationClosed

def CompartmentModelClosed (C : CompartmentModel) : Prop :=
  C.transmissionRate ∧ C.recoveryRate ∧ C.populationClosed

theorem compartment_model_closed_from_evidence (C : CompartmentModel) (E : CompartmentModelEvidence C) :
    CompartmentModelClosed C := by
  exact And.intro E.transmissionRateClosed (And.intro E.recoveryRateClosed E.populationClosedClosed)

end MedicineSeroepidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
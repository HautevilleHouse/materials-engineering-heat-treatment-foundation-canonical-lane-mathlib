import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

def ConstrainedHeatTreatmentClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_heat_treatment_endgame (A : AdmissibleClass) :
    ConstrainedHeatTreatmentClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse

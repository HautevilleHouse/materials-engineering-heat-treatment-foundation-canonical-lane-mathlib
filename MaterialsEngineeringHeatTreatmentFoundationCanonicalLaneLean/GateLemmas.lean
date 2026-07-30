import canonicalLaneMathlib.AdmissibleClass
import MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse
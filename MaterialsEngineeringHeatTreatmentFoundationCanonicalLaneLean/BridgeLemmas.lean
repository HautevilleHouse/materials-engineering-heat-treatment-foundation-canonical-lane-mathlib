import canonicalLaneMathlib.AdmissibleClass
import MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MaterialsEngineeringHeatTreatmentWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse
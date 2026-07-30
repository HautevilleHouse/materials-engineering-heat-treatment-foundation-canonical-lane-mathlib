import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

structure ElasticityPackage where
  youngModulus : ℕ
  poissonRatio : ℕ
  shearModulus : ℕ
  bulkModulus : ℕ

structure ElasticityEvidence (E : ElasticityPackage) where
  youngModulusClosed : E.youngModulus > 0
  poissonRatioClosed : E.poissonRatio ≥ 0 ∧ E.poissonRatio ≤ 500
  shearModulusClosed : E.shearModulus > 0
  bulkModulusClosed : E.bulkModulus > 0

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.youngModulus > 0 ∧
  (E.poissonRatio ≥ 0 ∧ E.poissonRatio ≤ 500) ∧
  E.shearModulus > 0 ∧
  E.bulkModulus > 0

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  exact And.intro Ev.youngModulusClosed (And.intro Ev.poissonRatioClosed (And.intro Ev.shearModulusClosed Ev.bulkModulusClosed))

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse
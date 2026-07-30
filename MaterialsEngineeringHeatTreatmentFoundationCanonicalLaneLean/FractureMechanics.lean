import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

structure FractureMechanicsPackage where
  stressIntensityFactor : ℕ
  fractureToughness : ℕ
  crackLength : ℕ
  appliedStress : ℕ

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  stressIntensityFactorClosed : F.stressIntensityFactor ≥ 0
  fractureToughnessClosed : F.fractureToughness > 0
  crackLengthClosed : F.crackLength > 0
  appliedStressClosed : F.appliedStress > 0

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.stressIntensityFactor ≥ 0 ∧
  F.fractureToughness > 0 ∧
  F.crackLength > 0 ∧
  F.appliedStress > 0

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage) (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F := by
  exact And.intro E.stressIntensityFactorClosed (And.intro E.fractureToughnessClosed (And.intro E.crackLengthClosed E.appliedStressClosed))

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse
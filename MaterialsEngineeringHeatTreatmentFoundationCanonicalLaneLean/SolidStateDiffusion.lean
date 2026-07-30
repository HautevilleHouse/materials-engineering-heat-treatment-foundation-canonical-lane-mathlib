import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

structure SolidStateDiffusionPackage where
  diffusionCoefficient : ℝ
  temperatureDependence : ℝ → ℝ
  concentrationProfile : Type u
  ficksLaw : Prop
  arrheniusEquation : Prop
  diffusionCoefficientComputed : Prop
  temperatureDependenceClosed : Prop
  concentrationProfileDefined : Prop
  ficksLawClosed : Prop
  arrheniusEquationClosed : Prop
  diffusionCoefficientComputedTerm : diffusionCoefficientComputed
  temperatureDependenceClosedTerm : temperatureDependenceClosed
  concentrationProfileDefinedTerm : concentrationProfileDefined
  ficksLawClosedTerm : ficksLawClosed
  arrheniusEquationClosedTerm : arrheniusEquationClosed

structure SolidStateDiffusionEvidence (D : SolidStateDiffusionPackage) where
  diffusionCoefficientComputedClosed : D.diffusionCoefficientComputed
  temperatureDependenceClosed : D.temperatureDependenceClosed
  concentrationProfileDefinedClosed : D.concentrationProfileDefined
  ficksLawClosed : D.ficksLaw
  arrheniusEquationClosed : D.arrheniusEquation

def SolidStateDiffusionClosed (D : SolidStateDiffusionPackage) : Prop :=
  D.diffusionCoefficientComputed ∧ D.temperatureDependenceClosed ∧ D.concentrationProfileDefined ∧ D.ficksLaw ∧ D.arrheniusEquation

theorem solid_state_diffusion_closed_from_evidence (D : SolidStateDiffusionPackage) (E : SolidStateDiffusionEvidence D) : SolidStateDiffusionClosed D := by
  exact And.intro E.diffusionCoefficientComputedClosed (And.intro E.temperatureDependenceClosed (And.intro E.concentrationProfileDefinedClosed (And.intro E.ficksLawClosed E.arrheniusEquationClosed)))

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse
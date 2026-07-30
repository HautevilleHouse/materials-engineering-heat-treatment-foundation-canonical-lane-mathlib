import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

structure DiffusionModel where
  diffusivity : Float
  activationEnergy : Float
  fickSecondLaw : Prop
  carburizingProfile : Prop

def DiffusionModelClosed (D : DiffusionModel) : Prop :=
  D.fickSecondLaw ∧ D.carburizingProfile

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse
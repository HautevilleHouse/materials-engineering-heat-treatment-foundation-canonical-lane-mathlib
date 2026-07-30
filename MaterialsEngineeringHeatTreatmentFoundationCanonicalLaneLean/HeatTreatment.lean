import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

structure HeatTreatmentPackage where
  annealingTemperature : Nat
  quenchingRate : Nat
  temperingTime : Nat
  hardenability : String
  phaseTransformation : String

structure HeatTreatmentEvidence (H : HeatTreatmentPackage) where
  annealingTemperaturePositive : H.annealingTemperature > 0
  quenchingRatePositive : H.quenchingRate > 0
  temperingTimePositive : H.temperingTime > 0
  hardenabilityClosed : H.hardenability ≠ ""
  phaseTransformationClosed : H.phaseTransformation ≠ ""

def HeatTreatmentClosed (H : HeatTreatmentPackage) : Prop :=
  H.annealingTemperature > 0 ∧
  H.quenchingRate > 0 ∧
  H.temperingTime > 0 ∧
  H.hardenability ≠ "" ∧
  H.phaseTransformation ≠ ""

theorem heat_treatment_closed_from_evidence (H : HeatTreatmentPackage) (E : HeatTreatmentEvidence H) :
    HeatTreatmentClosed H := by
  exact And.intro E.annealingTemperaturePositive (And.intro E.quenchingRatePositive (And.intro E.temperingTimePositive (And.intro E.hardenabilityClosed E.phaseTransformationClosed)))

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse

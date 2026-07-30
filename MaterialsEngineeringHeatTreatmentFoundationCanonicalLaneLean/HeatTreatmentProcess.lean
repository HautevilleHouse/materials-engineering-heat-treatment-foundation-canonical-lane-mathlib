import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

structure HeatTreatmentProcessPackage where
  annealingTemperature : ℕ
  quenchingRate : ℕ
  temperingTime : ℕ
  hardenability : ℕ

structure HeatTreatmentProcessEvidence (H : HeatTreatmentProcessPackage) where
  annealingTemperatureClosed : H.annealingTemperature ≥ 800 ∧ H.annealingTemperature ≤ 1200
  quenchingRateClosed : H.quenchingRate > 0
  temperingTimeClosed : H.temperingTime > 0
  hardenabilityClosed : H.hardenability ≥ 0 ∧ H.hardenability ≤ 100

def HeatTreatmentProcessClosed (H : HeatTreatmentProcessPackage) : Prop :=
  (H.annealingTemperature ≥ 800 ∧ H.annealingTemperature ≤ 1200) ∧
  H.quenchingRate > 0 ∧
  H.temperingTime > 0 ∧
  (H.hardenability ≥ 0 ∧ H.hardenability ≤ 100)

theorem heat_treatment_process_closed_from_evidence (H : HeatTreatmentProcessPackage) (E : HeatTreatmentProcessEvidence H) : HeatTreatmentProcessClosed H := by
  exact And.intro E.annealingTemperatureClosed (And.intro E.quenchingRateClosed (And.intro E.temperingTimeClosed E.hardenabilityClosed))

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse
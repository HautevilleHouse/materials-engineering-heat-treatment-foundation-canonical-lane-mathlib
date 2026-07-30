import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundation

structure QuenchingMedium where
  name : String
  heatTransferCoefficient : Float
  boilingPoint : Float

structure ThermalProfile where
  time : Nat
  temperature : Float
  coolingRate : Float

structure QuenchingEvidence (M : QuenchingMedium) (P : ThermalProfile) where
  htcPositive : M.heatTransferCoefficient > 0.0
  boilingPositive : M.boilingPoint > 0.0
  coolingRateNegative : ∀ (t : Nat), P.coolingRate < 0.0

def QuenchingClosed (M : QuenchingMedium) (P : ThermalProfile) : Prop :=
  M.heatTransferCoefficient > 0.0 ∧
  M.boilingPoint > 0.0 ∧
  (∀ (t : Nat), P.coolingRate < 0.0)

theorem quenching_closed_from_evidence (M : QuenchingMedium) (P : ThermalProfile)
    (E : QuenchingEvidence M P) : QuenchingClosed M P :=
  And.intro E.htcPositive (And.intro E.boilingPositive E.coolingRateNegative)

end MaterialsEngineeringHeatTreatmentFoundation
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundation

structure HeatTreatmentProcess where
  time : Nat
  temperature : Float
  phase : String

structure PhaseTransformation where
  initialPhase : String
  finalPhase : String
  temperatureRange : Float × Float
  kineticsRate : Float

structure PhaseTransformationEvidence (P : PhaseTransformation) where
  transformationOccurs : P.initialPhase ≠ P.finalPhase
  temperatureBoundsClosed : P.temperatureRange.1 ≤ P.temperatureRange.2
  kineticsPositive : P.kineticsRate > 0.0

def PhaseTransformationClosed (P : PhaseTransformation) : Prop :=
  P.initialPhase ≠ P.finalPhase ∧
  P.temperatureRange.1 ≤ P.temperatureRange.2 ∧
  P.kineticsRate > 0.0

theorem phase_transformation_closed_from_evidence (P : PhaseTransformation)
    (E : PhaseTransformationEvidence P) : PhaseTransformationClosed P :=
  And.intro E.transformationOccurs
    (And.intro E.temperatureBoundsClosed E.kineticsPositive)

end MaterialsEngineeringHeatTreatmentFoundation
end HautevilleHouse
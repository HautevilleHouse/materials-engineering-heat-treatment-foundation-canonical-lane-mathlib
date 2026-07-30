import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundation

structure TTTPhase where
  phaseName : String
  startTime : Float
  finishTime : Float
  temperature : Float

structure TTTDiagram where
  austenitizingTemperature : Float
  phases : List TTTPhase
  criticalCoolingRate : Float

structure TTTEvidence (D : TTTDiagram) where
  austenitizingPositive : D.austenitizingTemperature > 0.0
  phaseTimesConsistent : ∀ p ∈ D.phases, p.startTime ≤ p.finishTime
  criticalRatePositive : D.criticalCoolingRate > 0.0

def TTTClosed (D : TTTDiagram) : Prop :=
  D.austenitizingTemperature > 0.0 ∧
  (∀ p ∈ D.phases, p.startTime ≤ p.finishTime) ∧
  D.criticalCoolingRate > 0.0

theorem ttt_closed_from_evidence (D : TTTDiagram) (E : TTTEvidence D) : TTTClosed D :=
  And.intro E.austenitizingPositive
    (And.intro E.phaseTimesConsistent E.criticalRatePositive)

end MaterialsEngineeringHeatTreatmentFoundation
end HautevilleHouse
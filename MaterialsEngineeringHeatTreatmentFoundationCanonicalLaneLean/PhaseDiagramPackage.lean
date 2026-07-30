import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

structure PhaseDiagramPackage where
  componentSystem : Type u
  phases : List Type v
  phaseTransitions : Type w
  eutecticPoint : Prop
  peritecticPoint : Prop
  phaseRuleSatisfied : Prop
  leverRule : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  eutecticPointClosed : P.eutecticPoint
  peritecticPointClosed : P.peritecticPoint
  phaseRuleSatisfiedClosed : P.phaseRuleSatisfied
  leverRuleClosed : P.leverRule

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.eutecticPoint ∧ P.peritecticPoint ∧ P.phaseRuleSatisfied ∧ P.leverRule

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.eutecticPointClosed
    (And.intro E.peritecticPointClosed
      (And.intro E.phaseRuleSatisfiedClosed E.leverRuleClosed))

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse

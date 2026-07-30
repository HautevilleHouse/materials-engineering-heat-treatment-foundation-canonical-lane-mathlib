import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

structure PhaseDiagramPackage where
  phases : List String
  eutecticPoint : ℕ
  eutectoidPoint : ℕ
  solubilityLimits : List (ℕ × ℕ)

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  phasesClosed : P.phases.length ≥ 2
  eutecticPointClosed : P.eutecticPoint ≥ 0
  eutectoidPointClosed : P.eutectoidPoint ≥ 0
  solubilityLimitsClosed : ∀ (l : ℕ × ℕ), l ∈ P.solubilityLimits → l.1 ≤ l.2

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.phases.length ≥ 2 ∧
  P.eutecticPoint ≥ 0 ∧
  P.eutectoidPoint ≥ 0 ∧
  ∀ (l : ℕ × ℕ), l ∈ P.solubilityLimits → l.1 ≤ l.2

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.phasesClosed (And.intro E.eutecticPointClosed (And.intro E.eutectoidPointClosed E.solubilityLimitsClosed))

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse
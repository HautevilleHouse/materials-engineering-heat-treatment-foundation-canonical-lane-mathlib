import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

structure PhaseDiagramPackage where
  phases : List String
  eutecticPoint : Nat
  eutectoidPoint : Nat
  solidusCurve : String
  liquidusCurve : String

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  phasesNonEmpty : P.phases ≠ []
  eutecticPointClosed : P.eutecticPoint > 0
  eutectoidPointClosed : P.eutectoidPoint > 0
  solidusCurveClosed : P.solidusCurve ≠ ""
  liquidusCurveClosed : P.liquidusCurve ≠ ""

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.phases ≠ [] ∧
  P.eutecticPoint > 0 ∧
  P.eutectoidPoint > 0 ∧
  P.solidusCurve ≠ "" ∧
  P.liquidusCurve ≠ ""

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  exact And.intro E.phasesNonEmpty (And.intro E.eutecticPointClosed (And.intro E.eutectoidPointClosed (And.intro E.solidusCurveClosed E.liquidusCurveClosed)))

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse

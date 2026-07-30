import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

structure CrystallographyPackage where
  bravaisLatticeType : String
  unitCellVolume : Nat
  symmetryGroup : String
  millerIndices : String
  xrdPatternParameters : String

structure CrystallographyEvidence (C : CrystallographyPackage) where
  bravaisLatticeTypeClosed : C.bravaisLatticeType = "BCC" ∨ C.bravaisLatticeType = "FCC" ∨ C.bravaisLatticeType = "HCP"
  unitCellVolumePositive : C.unitCellVolume > 0
  symmetryGroupClosed : C.symmetryGroup ≠ ""
  millerIndicesClosed : C.millerIndices ≠ ""

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  (C.bravaisLatticeType = "BCC" ∨ C.bravaisLatticeType = "FCC" ∨ C.bravaisLatticeType = "HCP") ∧
  C.unitCellVolume > 0 ∧
  C.symmetryGroup ≠ "" ∧
  C.millerIndices ≠ ""

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) :
    CrystallographyClosed C := by
  exact And.intro E.bravaisLatticeTypeClosed (And.intro E.unitCellVolumePositive (And.intro E.symmetryGroupClosed E.millerIndicesClosed))

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse

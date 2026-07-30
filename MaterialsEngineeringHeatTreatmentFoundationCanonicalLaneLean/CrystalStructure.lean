import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

structure CrystalStructurePackage where
  latticeType : String
  bravaisLattice : String
  spaceGroup : String
  unitCellVolume : ℕ
  atomsPerUnitCell : ℕ

structure CrystalStructureEvidence (C : CrystalStructurePackage) where
  latticeTypeClosed : C.latticeType = "FCC" ∨ C.latticeType = "BCC" ∨ C.latticeType = "HCP"
  bravaisLatticeClosed : C.bravaisLattice ≠ ""
  spaceGroupClosed : C.spaceGroup ≠ ""
  unitCellVolumeClosed : C.unitCellVolume > 0
  atomsPerUnitCellClosed : C.atomsPerUnitCell > 0

def CrystalStructureClosed (C : CrystalStructurePackage) : Prop :=
  (C.latticeType = "FCC" ∨ C.latticeType = "BCC" ∨ C.latticeType = "HCP") ∧
  C.bravaisLattice ≠ "" ∧
  C.spaceGroup ≠ "" ∧
  C.unitCellVolume > 0 ∧
  C.atomsPerUnitCell > 0

theorem crystal_structure_closed_from_evidence (C : CrystalStructurePackage) (E : CrystalStructureEvidence C) : CrystalStructureClosed C := by
  exact And.intro E.latticeTypeClosed (And.intro E.bravaisLatticeClosed (And.intro E.spaceGroupClosed (And.intro E.unitCellVolumeClosed E.atomsPerUnitCellClosed)))

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse
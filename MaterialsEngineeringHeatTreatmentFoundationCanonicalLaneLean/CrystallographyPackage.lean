import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

structure CrystallographyPackage where
  latticeType : Type u
  unitCell : Type v
  bravaisLattice : Prop
  spaceGroup : Prop
  millerIndices : Type w
  xrayDiffractionPattern : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  bravaisLatticeClosed : C.bravaisLattice
  spaceGroupClosed : C.spaceGroup
  xrayDiffractionPatternClosed : C.xrayDiffractionPattern

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.bravaisLattice ∧ C.spaceGroup ∧ C.xrayDiffractionPattern

theorem crystallography_closed_from_evidence (C : CrystallographyPackage)
    (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.bravaisLatticeClosed
    (And.intro E.spaceGroupClosed E.xrayDiffractionPatternClosed)

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse

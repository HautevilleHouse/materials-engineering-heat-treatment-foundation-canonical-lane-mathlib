import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundation

structure HardnessCurve where
  depth : Float
  hardness : Float

structure Hardenability where
  idealCriticalDiameter : Float
  hardnessCurves : List HardnessCurve
  alloyFactor : Float

structure HardnessEvidence (H : Hardenability) where
  diameterPositive : H.idealCriticalDiameter > 0.0
  hardnessNonnegative : ∀ c ∈ H.hardnessCurves, c.hardness ≥ 0.0
  alloyFactorPositive : H.alloyFactor > 0.0

def HardnessClosed (H : Hardenability) : Prop :=
  H.idealCriticalDiameter > 0.0 ∧
  (∀ c ∈ H.hardnessCurves, c.hardness ≥ 0.0) ∧
  H.alloyFactor > 0.0

theorem hardness_closed_from_evidence (H : Hardenability) (E : HardnessEvidence H) : HardnessClosed H :=
  And.intro E.diameterPositive (And.intro E.hardnessNonnegative E.alloyFactorPositive)

end MaterialsEngineeringHeatTreatmentFoundation
end HautevilleHouse
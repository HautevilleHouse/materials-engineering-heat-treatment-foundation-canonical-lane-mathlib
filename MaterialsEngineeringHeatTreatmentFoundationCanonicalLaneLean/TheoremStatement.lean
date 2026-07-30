import HautevilleHouse.MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean

structure HeatTreatmentTheoremState where
  sourceKey : String
  theoremName : String
  classicalBoundary : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : HeatTreatmentTheoremState :=
  { sourceKey := "materials-engineering-heat-treatment-foundation",
    theoremName := "Materials Engineering Heat Treatment Foundation",
    classicalBoundary := "heat-treatment-classical-boundary",
    certificateLane := "heat_treatment_constrained",
    carriedRemainder := "carried-classical-remainder"
  }

end MaterialsEngineeringHeatTreatmentFoundationCanonicalLaneLean
end HautevilleHouse
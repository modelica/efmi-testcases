within eFMI_TestCases.RequiringInputDependentInitialization.M09_MixingUnit_FBL.Controllers;
model Controller
  extends .eFMI_TestCases.M09_MixingUnit_FBL.Controllers.Controller(
    filter(
      initType = .Modelica.Blocks.Types.Init.SteadyState));
end Controller;

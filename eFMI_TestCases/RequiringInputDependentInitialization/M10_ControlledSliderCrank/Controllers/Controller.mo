within eFMI_TestCases.RequiringInputDependentInitialization.M10_ControlledSliderCrank.Controllers;
model Controller
  extends .eFMI_TestCases.M10_ControlledSliderCrank.Controllers.Controller1(
    criticalDamping(
      initType = .Modelica.Blocks.Types.Init.SteadyState));
end Controller;

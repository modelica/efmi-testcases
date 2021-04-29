within eFMI_TestCases.RequiringInputDependentInitialization.M01_SimplePI.Controllers;
model PI "Time continuous Proportional+Integral control"
   extends eFMI_TestCases.M01_SimplePI.Controllers.PI(
     PI(
       initType = Modelica.Blocks.Types.Init.InitialOutput));

end PI;

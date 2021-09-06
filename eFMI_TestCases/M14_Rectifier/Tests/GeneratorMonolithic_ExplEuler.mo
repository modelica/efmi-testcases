within eFMI_TestCases.M14_Rectifier.Tests;
model GeneratorMonolithic_ExplEuler
  "Using the Generator with compact Modelica ODE formulation"
  extends TestSetups.GeneratorMonolithic_Modelica.OpenLoop(
    final clock(
      period = 0.001,
      useSolver = true,
      solverMethod = "ExplicitEuler"));

  annotation (experiment(
      StopTime=3.0,
      Interval=0.001,
      __Dymola_Algorithm="Euler"),
      __Dymola_Commands(file(
        ensureSimulated=true,
        autoRun=true) = "eFMI_TestCases/Resources/Scripts/Dymola/M14_Rectifier/plot.mos" "plot"),
       __iti_namesAtInterface={
  MapName(from="generator.U_Ideal",to="U_Ideal"),
  MapName(from="generator.U_Bat",to="U_Bat"),
  MapName(from="generator.I",to="I")},
  __fmi_modelExportName = "M14_B",
  __fmi_sourceModel = "eFMI_TestCases.M14_Rectifier.Controllers.GeneratorMonolithic_Modelica");
end GeneratorMonolithic_ExplEuler;

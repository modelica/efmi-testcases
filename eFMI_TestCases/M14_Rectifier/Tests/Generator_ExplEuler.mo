within eFMI_TestCases.M14_Rectifier.Tests;
model Generator_ExplEuler
  extends TestSetups.Generator.OpenLoop(
    final is_clocked = true,
    final clock(
      period = 0.001,
      useSolver = true,
      solverMethod = "ExplicitEuler"));

  annotation (
    experiment(
      StopTime=3.0,
      Interval=0.001,
      __Dymola_Algorithm="Dassl"),
      __Dymola_Commands(file(
        ensureSimulated=true,
        autoRun=true) = "M14_Rectifier/Resources/DymolaScripts/plot.mos" "plot"),
       __iti_namesAtInterface={
  MapName(from="generator.U_Ideal",to="U_Ideal"),
  MapName(from="generator.U_Bat",to="U_Bat"),
  MapName(from="generator.I",to="I")},
  __fmi_modelExportName = "M14_A",
  __fmi_sourceModel = "eFMI_TestCases.M14_Rectifier.Controllers.Generator");
end Generator_ExplEuler;

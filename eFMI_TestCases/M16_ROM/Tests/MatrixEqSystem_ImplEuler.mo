within eFMI_TestCases.M16_ROM.Tests;
model MatrixEqSystem_ImplEuler
  extends TestSetups.BaseSetup(
    final is_clocked = true,
    clock(
      useSolver = true,
      period = 0.1,
      solverMethod = "ImplicitEuler"));

  annotation (
    experiment(
      StopTime=160,
      Interval=0.1),
    __Dymola_experimentFlags(
      Hidden(InitializeClockedDiscretizedStates = true)),
    __Dymola_Commands(file(
        ensureSimulated=true) = "eFMI_TestCases/Resources/Scripts/Dymola/M16_ROM/plot.mos" "plot"),
     __iti_namesAtInterface={
  MapName(from="matrixEqSystem.n",to="n"),
  MapName(from="matrixEqSystem.tau",to="tau"),
  MapName(from="matrixEqSystem.y",to="y")},
  __fmi_modelExportName = "M16_A",
  __fmi_sourceModel = "eFMI_TestCases.M16_ROM.Controllers.MatrixEqSystem");
end MatrixEqSystem_ImplEuler;

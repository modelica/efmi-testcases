within eFMI_TestCases.M15_AirSystem.Tests;
model AirSystem_ExplEuler
  extends TestSetups.OpenLoop(
    final is_clocked = true,
    final clock(
      period = 0.001,
      useSolver = true,
      solverMethod = "ExplicitEuler"));
  extends eFMI_TestCases.Icons.PerformanceTest;

  annotation (
    experiment(
      StopTime=4,
      Interval=0.001,
      __Dymola_Algorithm="Euler"),
    __Dymola_Commands(
      file(
        ensureSimulated = true,
        autoRun = true) = "M15_AirSystem/Resources/DymolaScripts/plot.mos" "plot"),
    __iti_namesAtInterface={
  MapName(from="airSystem.v",to="v"),
  MapName(from="airSystem.m_dot_f_i",to="m_dot_f_i"),
  MapName(from="airSystem.T_i",to="T_i"),
  MapName(from="airSystem.p_i",to="p_i"),
  MapName(from="airSystem.AFR",to="AFR"),
  MapName(from="airSystem.n",to="n")},
  __fmi_modelExportName = "M15_A",
  __fmi_sourceModel = "eFMI_TestCases.M15_AirSystem.Controllers.AirSystem",
    __Dymola_experimentSetupOutput(doublePrecision=true, events=false));
end AirSystem_ExplEuler;

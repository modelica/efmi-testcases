within eFMI_TestCases.M15_AirSystem.Tests;
model AirSystem_Rosenbrock1
  extends TestSetups.OpenLoop(
    final is_clocked = true,
    final clock(
      period = 0.05,
      useSolver = true,
      solverMethod = "Rosenbrock1"));
  extends eFMI_TestCases.Icons.PerformanceTest;

  annotation (
    experiment(
      StopTime=4,
      Interval=0.05),
   __iti_namesAtInterface={
  MapName(from="airSystem.v",to="v"),
  MapName(from="airSystem.m_dot_f_i",to="m_dot_f_i"),
  MapName(from="airSystem.T_i",to="T_i"),
  MapName(from="airSystem.p_i",to="p_i"),
  MapName(from="airSystem.AFR",to="AFR"),
  MapName(from="airSystem.n",to="n")},
  __fmi_modelExportName = "M15_B",
  __fmi_sourceModel = "eFMI_TestCases.M15_AirSystem.Controllers.AirSystem",
    __Dymola_experimentFlags(Hidden(InitializeClockedDiscretizedStates=true)));
end AirSystem_Rosenbrock1;

within eFMI_TestCases.M15_AirSystem.Tests;
model AirSystem_ImplEuler
  extends TestSetups.OpenLoop(
    final is_clocked = true,
    final clock(
      period = 0.01,
      useSolver = true,
      solverMethod="ImplicitEuler"));

  annotation (
    experiment(
      StopTime=4,
      Interval=0.01,
      __Dymola_Algorithm="Euler"),
    __Dymola_Commands(file(ensureSimulated=true)=
        "M15_AirSystem/Resources/DymolaScripts/plot.mos" "plot"),
    __iti_namesAtInterface={
  MapName(from="airSystem.v",to="v"),
  MapName(from="airSystem.m_dot_f_i",to="m_dot_f_i"),
  MapName(from="airSystem.T_i",to="T_i"),
  MapName(from="airSystem.p_i",to="p_i"),
  MapName(from="airSystem.AFR",to="AFR"),
  MapName(from="airSystem.n",to="n")},
  __fmi_modelExportName = "M15_C",
  __fmi_sourceModel = "eFMI_TestCases.M15_AirSystem.Controllers.AirSystem",
    __Dymola_experimentSetupOutput(doublePrecision=true, events=false));
end AirSystem_ImplEuler;

within eFMI_TestCases.M15_AirSystem.ReferenceTests;
model AirSystem_ExplEuler
  extends Tests.AirSystem_ExplEuler;

   annotation (
    experiment(
      StopTime=4,
      Interval=0.001,
      __Dymola_Algorithm="Euler"),
    __fmi_InterfaceVariable={
  MapName(from="airSystem.v",to="v"),
  MapName(from="airSystem.m_dot_f_i",to="m_dot_f_i"),
  MapName(from="airSystem.T_i",to="T_i",isOutput=true),
  MapName(from="airSystem.p_i",to="p_i",isOutput=true),
  MapName(from="airSystem.AFR",to="AFR",isOutput=true),
  MapName(from="airSystem.n",to="n",isOutput=true)},
  __fmi_OriginalModel_ExportReference="eFMI_TestCases.M15_AirSystem.Tests.AirSystem_ExplEuler");
end AirSystem_ExplEuler;

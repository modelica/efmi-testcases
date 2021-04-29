within eFMI_TestCases.M15_AirSystem.ReferenceTests;
model AirSystem_Dassl
  extends TestSetups.OpenLoop;

   annotation (
    experiment(
      StopTime=4.0,
      Interval=0.001,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"),
    __fmi_InterfaceVariable={
  MapName(from="airSystem.v",to="v"),
  MapName(from="airSystem.m_dot_f_i",to="m_dot_f_i"),
  MapName(from="airSystem.T_i",to="T_i",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=0.3, absTol32=0.3)}),
  MapName(from="airSystem.p_i",to="p_i",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=200, absTol32=200)}),
  MapName(from="airSystem.AFR",to="AFR",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=0.03, absTol32=0.03)}),
  MapName(from="airSystem.n",to="n",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=0.03, absTol32=0.03)})},
  __fmi_OriginalModel_ExportReference="eFMI_TestCases.M15_AirSystem.Tests.AirSystem_ExplEuler");
end AirSystem_Dassl;

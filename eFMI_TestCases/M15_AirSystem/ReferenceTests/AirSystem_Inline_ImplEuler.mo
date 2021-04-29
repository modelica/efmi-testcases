within eFMI_TestCases.M15_AirSystem.ReferenceTests;
model AirSystem_Inline_ImplEuler
  extends TestSetups.OpenLoop;

  annotation (
    experiment(
      StopTime=4.0,
      Interval=0.001,
      Tolerance=1e-05,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Euler"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=2,
        InlineFixedStep=0.001)),
   __fmi_InterfaceVariable={
  MapName(from="airSystem.v",to="v"),
  MapName(from="airSystem.m_dot_f_i",to="m_dot_f_i"),
  MapName(from="airSystem.T_i",to="T_i",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=0.3, absTol32=0.3)}),
  MapName(from="airSystem.p_i",to="p_i",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=200, absTol32=250)}),
  MapName(from="airSystem.AFR",to="AFR",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=0.02, absTol32=0.02)}),
  MapName(from="airSystem.n",to="n",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=0.003, absTol32=0.02)})},
  __fmi_OriginalModel_ExportReference="eFMI_TestCases.M15_AirSystem.Tests.AirSystem_ExplEuler");
end AirSystem_Inline_ImplEuler;

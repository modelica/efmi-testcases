within eFMI_TestCases.M06_SkyhookGroundhook.ReferenceTests;
model Controller_ExplEuler
  extends Tests.Controller_ExplEuler;

  annotation (
    experiment(
      StopTime=10,
      Interval=0.001),
   __fmi_InterfaceVariable={
  MapName(from="controller.v_body",to="v_body"),
  MapName(from="controller.v_wheel",to="v_wheel"),
  MapName(from="controller.v_damper",to="v_damper"),
  MapName(from="controller.u_damper",to="u_damper",isOutput=true)},
  __fmi_OriginalModel_ExportReference="eFMI_TestCases.M06_SkyhookGroundhook.Tests.Controller_ExplEuler");
end Controller_ExplEuler;

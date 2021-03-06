within eFMI_TestCases.M06_SkyhookGroundhook.Tests;
model Controller_ExplEuler
  "Skyhookgroundhook control of a semi-active damper"
  extends TestSetups.OpenLoop;

  annotation (
    experiment(
      StopTime=10,
      Interval=0.001),
   __iti_namesAtInterface={
  MapName(from="controller.v_body",to="v_body"),
  MapName(from="controller.v_wheel",to="v_wheel"),
  MapName(from="controller.v_damper",to="v_damper"),
  MapName(from="controller.u_damper",to="u_damper")},
  __fmi_modelExportName = "M06_A",
  __fmi_sourceModel = "eFMI_TestCases.M06_SkyhookGroundhook.Controllers.SkyhookGroundhook");
end Controller_ExplEuler;

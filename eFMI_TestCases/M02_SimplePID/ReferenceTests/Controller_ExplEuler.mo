within eFMI_TestCases.M02_SimplePID.ReferenceTests;
model Controller_ExplEuler
  extends Tests.Controller_ExplEuler;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=4.0,
      Interval=0.0001),
   __fmi_InterfaceVariable={MapName(from="u_s.y",to="u_s"),MapName(from="u_m.y",to="u_m"),MapName(from="controller.y",to="y",isOutput=true)},
  __fmi_OriginalModel_ExportReference="eFMI_TestCases.M02_SimplePID.Tests.Controller_ExplEuler");
end Controller_ExplEuler;

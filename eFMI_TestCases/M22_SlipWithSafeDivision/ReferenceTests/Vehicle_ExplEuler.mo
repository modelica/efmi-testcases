within eFMI_TestCases.M22_SlipWithSafeDivision.ReferenceTests;
model Vehicle_ExplEuler
  extends Tests.Vehicle_ExplEuler;

   annotation (experiment(StopTime=16, Interval = 0.002),
      __fmi_InterfaceVariable={MapName(from="vehicle.v_ref",to="v_ref"),
                             MapName(from="vehicle.w",to="w",isOutput=true)},
     __fmi_OriginalModel_ExportReference="eFMI_TestCases.M22_SlipWithSafeDivision.Tests.Vehicle_ExplEuler");
end Vehicle_ExplEuler;

within eFMI_TestCases.M22_SlipWithSafeDivision.Tests;
model Vehicle_ExplEuler
  extends TestSetups.OpenLoop;

  annotation (experiment(StopTime=16, Interval = 0.002),
     __iti_namesAtInterface={MapName(from="vehicle.v_ref",to="v_ref"),
                             MapName(from="vehicle.w",to="w")},
     __fmi_modelExportName = "M22_A",
  __fmi_sourceModel = "eFMI_TestCases.M22_SlipWithSafeDivision.Controllers.SimpleDrivenVehicleWithSlip");
end Vehicle_ExplEuler;

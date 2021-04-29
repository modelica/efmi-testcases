within eFMI.Tests.Tables;
model Test_CombiTable1Ds_eFMI
  extends Test_CombiTable1Ds_Modelica(
    table(final efmi = true));

  annotation (
    experiment(StopTime = 1.2));
end Test_CombiTable1Ds_eFMI;

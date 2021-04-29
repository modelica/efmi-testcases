within eFMI.Tests.Tables;
model Test_CombiTable2D_eFMI
  extends Test_CombiTable2D_Modelica(
    table(final efmi = true));

  annotation (
    experiment(StopTime = 1.2));
end Test_CombiTable2D_eFMI;

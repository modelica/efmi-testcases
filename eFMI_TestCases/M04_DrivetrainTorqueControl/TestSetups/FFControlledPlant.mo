within eFMI_TestCases.M04_DrivetrainTorqueControl.TestSetups;
model FFControlledPlant
  extends Modelica.Icons.Example;

  Utilities.DesiredTorque desiredTorque
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  PlantModels.PlantForSimulation  vehicle
    annotation (Placement(transformation(extent={{40,-20},{80,20}})));
  Modelica.Blocks.Math.Gain gain(
    k = 1/vehicle.gearRatio)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

equation
  connect(desiredTorque.y, gain.u)
    annotation (Line(
      points={{-59.025,0},{-22,0}},
      color={0,0,127}));
  connect(gain.y, vehicle.tauRef)
    annotation (Line(
      points={{1,0},{36,0}},
      color={0,0,127}));
end FFControlledPlant;

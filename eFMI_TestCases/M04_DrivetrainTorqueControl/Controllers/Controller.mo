within eFMI_TestCases.M04_DrivetrainTorqueControl.Controllers;
model Controller
  extends ControllerInterface;

  parameter Real Ni_PI = 1.34
    "Ni*Ti is time constant of anti-windup compensation";
  parameter Real Ti_PI = 1.25
    "Time constant of Integrator block";
  parameter Real gearRatio = 10
    "Gear ratio";
  parameter Real k_PI = -73
    "Gain of controller";
  parameter Real tauM_max = 1230
    "Max motor torque";

  .Modelica.Blocks.Math.Gain gear(
    k = gearRatio)
    annotation (Placement(transformation(extent={{8,0},{20,12}})));
  .Modelica.Blocks.Continuous.LimPID PI(
    final controllerType = .Modelica.Blocks.Types.SimpleController.PI,
    final withFeedForward = true,
    k(min = -500) = k_PI,
    I(y(min = -1e4,
        max = 1e4)),
    yMax = tauM_max,
    wp = 1,
    Ti = Ti_PI,
    Ni = Ni_PI)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  .Modelica.Blocks.Math.Gain gear1(
    k = 1/gearRatio)
    annotation (Placement(transformation(extent={{74,-6},{86,6}})));
  .Modelica.Blocks.Continuous.CriticalDamping filter(
    x(each stateSelect=StateSelect.always),
    f = f_cut,
    initType = .Modelica.Blocks.Types.Init.InitialState,
    n = f_order)
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  .Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints
    annotation (Placement(transformation(extent={{-60,-20},{-10,20}})));
  PlantModels.PlantForInversion approxPlant(
    J_M = J_M,
    c_res = c_res,
    k_accCor = k_accCor,
    d_res = d_res,
    gearRatio = gearRatio)
    annotation (Placement(transformation(extent={{-20,-10},{-40,10}})));

equation
  connect(gear.y, PI.u_ff)
    annotation (Line(
      points={{20.6,6},{26,6},{26,-20},{56,-20},{56,-12}},
      color = {0,0,127},
      smooth = Smooth.None));
  connect(PI.y, gear1.u)
    annotation (Line(
      points={{61,0},{72.8,0}},
      color = {0,0,127}));
  connect(wRel, PI.u_m)
    annotation (Line(
      points={{0,-120},{0,-70},{50,-70},{50,-12}},
      color={0,0,127}));
  connect(gear1.y, M_motor)
    annotation (Line(
      points={{86.6,0},{110.25,0}},
      color={0,0,127}));
  connect(filter.y,inverseBlockConstraints. u1)
    annotation (Line(
      points={{-69,0},{-62.5,0}},
      color = {0,0,127}));
  connect(approxPlant.M_l,inverseBlockConstraints. u2)
    annotation (Line(
      points={{-42,0},{-55,0}},
      color = {0,0,127}));
  connect(approxPlant.M_m,inverseBlockConstraints. y2)
    annotation (Line(
      points={{-19,0},{-13.75,0}},
      color = {0,0,127}));
  connect(M_desired, filter.u)
    annotation (Line(
      points={{-120,0},{-92,0}},
      color={0,0,127}));
  connect(inverseBlockConstraints.y1, gear.u)
    annotation (Line(
      points={{-8.75,0},{-2,0},{-2,6},{6.8,6}},
      color={0,0,127}));
  connect(approxPlant.w_rel, PI.u_s)
    annotation (Line(
      points={{-30,-11},{-30,-24},{34,-24},{34,0},{38,0}},
      color={0,0,127}));
end Controller;

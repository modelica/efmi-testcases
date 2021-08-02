within eFMI_TestCases.M04_DrivetrainTorqueControl.Utilities;
block LimPI_withFeedForward
  "P, PI, PD, and PID controller with limited output, anti-windup compensation, setpoint weighting and feed forward"
  import InitPID =
         Modelica.Blocks.Types.Init;
  import Modelica.Blocks.Types.Init;
  import Modelica.Blocks.Types.SimpleController;
  extends Modelica.Blocks.Interfaces.SVcontrol;
 // output Real controlError = u_s - u_m
 // "Control error (set point - measurement)";

  parameter .Modelica.Blocks.Types.SimpleController controllerType=
         .Modelica.Blocks.Types.SimpleController.PI
  "Type of controller";
  parameter Real  k(unit="1") = 1 "Gain of controller";
  parameter SI.Time Ti(min=Modelica.Constants.small)=0.5
  "Time constant of Integrator block"   annotation (Dialog(enable=
          controllerType == .Modelica.Blocks.Types.SimpleController.PI or
          controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real yMax(start=1) "Upper limit of output";
  parameter Real yMin=-yMax "Lower limit of output";
  parameter Real wp(min=0) = 1
  "Set-point weight for Proportional block (0..1)";

  parameter Real Ni(min=100*Modelica.Constants.eps) = 0.9
  "Ni*Ti is time constant of anti-windup compensation"
     annotation(Dialog(enable=controllerType==.Modelica.Blocks.Types.SimpleController.PI or
                              controllerType==.Modelica.Blocks.Types.SimpleController.PID));
  parameter .Modelica.Blocks.Types.Init initType=.Modelica.Blocks.Types.Init.InitialState
    "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)"
    annotation (Evaluate=true, Dialog(group="Initialization"));
  parameter Boolean limitsAtInit = true
  "= false, if limits are ignored during initialization"
    annotation(Evaluate=true, Dialog(group="Initialization"));
  parameter Real xi_start=0
  "Initial or guess value value for integrator output (= integrator state)"
    annotation (Dialog(group="Initialization",
                enable=controllerType==.Modelica.Blocks.Types.SimpleController.PI or
                       controllerType==.Modelica.Blocks.Types.SimpleController.PID));
  parameter Real y_start=0 "Initial value of output"
    annotation(Dialog(enable=initType == .Modelica.Blocks.Types.Init.InitialOutput,    group=
          "Initialization"));
  parameter Boolean strict=false
  "= true, if strict limits with noEvent(..)"
    annotation (Evaluate=true, choices(checkBox=true), Dialog(tab="Advanced"));
  constant SI.Time unitTime=1  annotation(HideResult=true);
  Modelica.Blocks.Math.Add addP(k1=wp, k2=-1) annotation (Placement(
        transformation(extent={{-80,10},{-60,30}}, rotation=0)));
  Modelica.Blocks.Math.Gain P(k=1) annotation (Placement(transformation(extent={{-50,10},
            {-30,30}},          rotation=0)));
  Modelica.Blocks.Continuous.Integrator I(
    k=unitTime/Ti,
    y_start=xi_start,
    initType=if initType == InitPID.SteadyState then Init.SteadyState else if
        initType == InitPID.InitialState or initType == InitPID.InitialState
         then Init.InitialState else Init.NoInit) if with_I annotation (
      Placement(transformation(extent={{-50,-40},{-30,-20}}, rotation=0)));
  Modelica.Blocks.Math.Gain gainPI(k=k) annotation (Placement(transformation(
          extent={{12,-16},{32,4}}, rotation=0)));
  Modelica.Blocks.Math.Add addPI annotation (Placement(transformation(extent={{-16,
            -16},{4,4}}, rotation=0)));
  Modelica.Blocks.Math.Add3 addI(k2=-1) if with_I annotation (Placement(
        transformation(extent={{-80,-40},{-60,-20}}, rotation=0)));
  Modelica.Blocks.Math.Add addSat(k1=-1, k2=+1) if with_I annotation (Placement(
        transformation(
        origin={42,-70},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  Modelica.Blocks.Math.Gain gainTrack(k=1/(k*Ni)) if with_I annotation (
      Placement(transformation(extent={{20,-80},{0,-60}},  rotation=0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(
    uMax=yMax,
    uMin=yMin,
    strict=strict) annotation (Placement(transformation(extent={{70,-10},{90,10}},
          rotation=0)));
protected
  parameter Boolean with_I = controllerType==SimpleController.PI or
                             controllerType==SimpleController.PID annotation(Evaluate=true, HideResult=true);
public
  Modelica.Blocks.Interfaces.RealInput y_ff "Feed-Forward term" annotation (
      Placement(transformation(rotation=0, extent={{-140,40},{-100,80}}),
        iconTransformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Math.Add add_ff(              k2=1, k1=1)
                                                      annotation (Placement(
        transformation(extent={{40,-10},{60,10}}, rotation=0)));
initial equation
  if initType==InitPID.InitialOutput then
     gainPI.y = y_start;
  end if;
equation
  assert(yMax >= yMin, "LimPID: Limits must be consistent. However, yMax (=" + String(yMax) +
                       ") < yMin (=" + String(yMin) + ")");
  if initType ==InitPID.InitialOutput  and (y_start < yMin or y_start > yMax) then
      Modelica.Utilities.Streams.error("LimPID: Start value y_start (=" + String(y_start) +
         ") is outside of the limits of yMin (=" + String(yMin) +") and yMax (=" + String(yMax) + ")");
  end if;
  assert(limitsAtInit or not limitsAtInit and y >= yMin and y <= yMax,
         "LimPID: During initialization the limits have been switched off.\n" +
         "After initialization, the output y (=" + String(y) +
         ") is outside of the limits of yMin (=" + String(yMin) +") and yMax (=" + String(yMax) + ")");

  connect(u_s, addP.u1) annotation (Line(points={{-120,0},{-96,0},{-96,26},{-82,
          26}},     color={0,0,127}));
  connect(u_s, addI.u1) annotation (Line(points={{-120,0},{-96,0},{-96,-22},{-82,
          -22}},     color={0,0,127}));
  connect(addP.y, P.u) annotation (Line(points={{-59,20},{-52,20}}, color={0,
          0,127}));
  connect(addI.y, I.u) annotation (Line(points={{-59,-30},{-52,-30}}, color={
          0,0,127}));
  connect(P.y, addPI.u1) annotation (Line(points={{-29,20},{-24,20},{-24,0},{-18,
          0}}, color={0,0,127}));
  connect(addPI.y, gainPI.u)
    annotation (Line(points={{5,-6},{8,-6},{10,-6}}, color={0,0,127}));
  connect(limiter.y, y)
    annotation (Line(points={{91,0},{110,0}}, color={0,0,127}));
  connect(gainTrack.y, addI.u3) annotation (Line(points={{-1,-70},{-88,-70},{-88,
          -38},{-82,-38}},     color={0,0,127}));
  connect(u_m, addP.u2) annotation (Line(
      points={{0,-120},{0,-92},{-92,-92},{-92,14},{-82,14}},
      color={0,0,127},
      thickness=0.5));
  connect(u_m, addI.u2) annotation (Line(
      points={{0,-120},{0,-92},{-92,-92},{-92,-30},{-82,-30}},
      color={0,0,127},
      thickness=0.5));

  connect(gainPI.y, add_ff.u2) annotation (Line(
      points={{33,-6},{38,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add_ff.y, limiter.u) annotation (Line(
      points={{61,0},{68,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(y_ff, add_ff.u1) annotation (Line(
      points={{-120,60},{32,60},{32,6},{38,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(I.y, addPI.u2) annotation (Line(points={{-29,-30},{-24,-30},{-24,-12},
          {-18,-12}}, color={0,0,127}));
  connect(addSat.y, gainTrack.u)
    annotation (Line(points={{31,-70},{22,-70}}, color={0,0,127}));
  connect(addSat.u1, limiter.u) annotation (Line(points={{54,-64},{64,-64},{64,0},
          {68,0}}, color={0,0,127}));
  connect(addSat.u2, y) annotation (Line(points={{54,-76},{96,-76},{96,0},{110,0}},
        color={0,0,127}));
       annotation(Dialog(enable=controllerType==.Modelica.Blocks.Types.SimpleController.PD or
                                controllerType==.Modelica.Blocks.Types.SimpleController.PID),
              defaultComponentName="PID",
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}}), graphics={
        Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
        Polygon(
          points={{90,-80},{68,-72},{68,-88},{90,-80}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,-80},{-80,-20},{30,60},{80,60}}, color={0,0,127}),
        Text(
          extent={{-20,-20},{80,-60}},
          lineColor={192,192,192},
          textString="%controllerType"),
        Line(
          visible=strict,
          points={{30,60},{81,60}},
          color={255,0,0},
          smooth=Smooth.None)}),
    Documentation(info="<HTML>
<p>
Via parameter <b>controllerType</b> either <b>P</b>, <b>PI</b>, <b>PD</b>,
or <b>PID</b> can be selected. If, e.g., PI is selected, all components belonging to the
D-part are removed from the block (via conditional declarations).
The example model
<a href=\"modelica://Modelica.Blocks.Examples.PID_Controller\">Modelica.Blocks.Examples.PID_Controller</a>
demonstrates the usage of this controller.
Several practical aspects of PID controller design are incorporated
according to chapter 3 of the book:
</p>

<dl>
<dt>&Aring;str&ouml;m K.J., and H&auml;gglund T.:</dt>
<dd> <b>PID Controllers: Theory, Design, and Tuning</b>.
     Instrument Society of America, 2nd edition, 1995.
</dd>
</dl>

<p>
Besides the additive <b>proportional, integral</b> and <b>derivative</b>
part of this controller, the following features are present:
</p>
<ul>
<li> The output of this controller is limited. If the controller is
     in its limits, anti-windup compensation is activated to drive
     the integrator state to zero. </li>
<li> The high-frequency gain of the derivative part is limited
     to avoid excessive amplification of measurement noise.</li>
<li> Setpoint weighting is present, which allows to weight
     the setpoint in the proportional and the derivative part
     independently from the measurement. The controller will respond
     to load disturbances and measurement noise independently of this setting
     (parameters wp, wd). However, setpoint changes will depend on this
     setting. For example, it is useful to set the setpoint weight wd
     for the derivative part to zero, if steps may occur in the
     setpoint signal.</li>
</ul>

<p>
The parameters of the controller can be manually adjusted by performing
simulations of the closed loop system (= controller + plant connected
together) and using the following strategy:
</p>

<ol>
<li> Set very large limits, e.g., yMax = Modelica.Constants.inf</li>
<li> Select a <b>P</b>-controller and manually enlarge parameter <b>k</b>
     (the total gain of the controller) until the closed-loop response
     cannot be improved any more.</li>
<li> Select a <b>PI</b>-controller and manually adjust parameters
     <b>k</b> and <b>Ti</b> (the time constant of the integrator).
     The first value of Ti can be selected, such that it is in the
     order of the time constant of the oscillations occurring with
     the P-controller. If, e.g., vibrations in the order of T=10 ms
     occur in the previous step, start with Ti=0.01 s.</li>
<li> If you want to make the reaction of the control loop faster
     (but probably less robust against disturbances and measurement noise)
     select a <b>PID</b>-Controller and manually adjust parameters
     <b>k</b>, <b>Ti</b>, <b>Td</b> (time constant of derivative block).</li>
<li> Set the limits yMax and yMin according to your specification.</li>
<li> Perform simulations such that the output of the PID controller
     goes in its limits. Tune <b>Ni</b> (Ni*Ti is the time constant of
     the anti-windup compensation) such that the input to the limiter
     block (= limiter.u) goes quickly enough back to its limits.
     If Ni is decreased, this happens faster. If Ni=infinity, the
     anti-windup compensation is switched off and the controller works bad.</li>
</ol>

<p>
<b>Initialization</b>
</p>

<p>
This block can be initialized in different
ways controlled by parameter <b>initType</b>. The possible
values of initType are defined in
<a href=\"modelica://Modelica.Blocks.Types.InitPID\">Modelica.Blocks.Types.InitPID</a>.
This type is identical to
<a href=\"modelica://Modelica.Blocks.Types.Init\">Types.Init</a>,
with the only exception that the additional option
<b>DoNotUse_InitialIntegratorState</b> is added for
backward compatibility reasons (= integrator is initialized with
InitialState whereas differential part is initialized with
NoInit which was the initialization in version 2.2 of the Modelica
standard library).
</p>

<p>
Based on the setting of initType, the integrator (I) and derivative (D)
blocks inside the PID controller are initialized according to the following table:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>initType</b></td>
      <td valign=\"top\"><b>I.initType</b></td>
      <td valign=\"top\"><b>D.initType</b></td></tr>

  <tr><td valign=\"top\"><b>NoInit</b></td>
      <td valign=\"top\">NoInit</td>
      <td valign=\"top\">NoInit</td></tr>

  <tr><td valign=\"top\"><b>SteadyState</b></td>
      <td valign=\"top\">SteadyState</td>
      <td valign=\"top\">SteadyState</td></tr>

  <tr><td valign=\"top\"><b>InitialState</b></td>
      <td valign=\"top\">InitialState</td>
      <td valign=\"top\">InitialState</td></tr>

  <tr><td valign=\"top\"><b>InitialOutput</b><br>
          and initial equation: y = y_start</td>
      <td valign=\"top\">NoInit</td>
      <td valign=\"top\">SteadyState</td></tr>

  <tr><td valign=\"top\"><b>DoNotUse_InitialIntegratorState</b></td>
      <td valign=\"top\">InitialState</td>
      <td valign=\"top\">NoInit</td></tr>
</table>

<p>
In many cases, the most useful initial condition is
<b>SteadyState</b> because initial transients are then no longer
present. If initType = InitPID.SteadyState, then in some
cases difficulties might occur. The reason is the
equation of the integrator:
</p>

<pre>
   <b>der</b>(y) = k*u;
</pre>

<p>
The steady state equation \"der(x)=0\" leads to the condition that the input u to the
integrator is zero. If the input u is already (directly or indirectly) defined
by another initial condition, then the initialization problem is <b>singular</b>
(has none or infinitely many solutions). This situation occurs often
for mechanical systems, where, e.g., u = desiredSpeed - measuredSpeed and
since speed is both a state and a derivative, it is natural to
initialize it with zero. As sketched this is, however, not possible.
The solution is to not initialize u_m or the variable that is used
to compute u_m by an algebraic equation.
</p>

<p>
If parameter <b>limitAtInit</b> = <b>false</b>, the limits at the
output of this controller block are removed from the initialization problem which
leads to a much simpler equation system. After initialization has been
performed, it is checked via an assert whether the output is in the
defined limits. For backward compatibility reasons
<b>limitAtInit</b> = <b>true</b>. In most cases it is best
to use <b>limitAtInit</b> = <b>false</b>.
</p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})));
end LimPI_withFeedForward;

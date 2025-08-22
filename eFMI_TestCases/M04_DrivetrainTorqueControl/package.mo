within eFMI_TestCases;
package M04_DrivetrainTorqueControl "Example to reduce the vibrations in an electric drivetrain by using a
   torque controller with an inverse model of the drivetrain."
  extends .Modelica.Icons.ExamplesPackage;

  import  Modelica.Units.SI;
  import ConvertSI =  Modelica.Units.Conversions;
  import  Modelica.Constants.pi;
  import  Modelica.Constants.e;

  annotation (preferredView="info", Documentation(info="<html>
<p>
The problem considered in this example is the control design for an 
electric drivetrain found in electric vehicles. In contrast to common 
control approaches, this example focuses on the control of the traction torque 
acting directly at the wheel hub instead of the motor torque. The 
challenge of this approach is the compensation of torque oscillations 
introduced by gear elasticity and backlash and the
unknown load torque produced by the tires. To achieve this goal an 
inverse model based control method is applied using the capabilities 
of Modelica tools to invert dynamic models.
</p>

<p>
The system architecture is depicted in the figure below. 
It consists of an electric motor connected to the two wheels of a single axle via a gearbox. 
Through the tire contact of the drive wheels the drivetrain interacts with the chassis mass 
of the vehicle where a variable drag force according to the actual vehicle and wind velocity is acting.
</p>

<p>
<img src=\"modelica://eFMI_TestCases/Resources/Images/M04_DriveTrainTorqueControl/plant1.png\">
</p>

<p>
The controller is implemented as a (as simple as possible) two-degree of freedom wheel-torque controller.
The task of the controller is to reduce vibrations in the drivetrain of the car.
They are mainly caused by the elasticity of the drive shaft and the wheel road contact.
The two degrees of freedom controller consists of a feed-forward controller and a feed-back controller.
The combination of the two controllers allows for a robust performance, even if modeling errors and sensor noise exist.
The input for the controller is a desired torque at the wheel mounting. For the sensors it is assumed,
that the relative velocity between the motor side and the wheel speed can be measured.
Similar measurement setups are known for ABS systems.
The main element of the feed-forward controller is an approximate (as simple as possible)
inverse model of the elastic drivetrain.
</p>

<h3>Main Authors</h3>

<blockquote>
Andreas Pfeiffer and Martin Otter (German Aerospace Center (DLR),
<a href=\"mailto:Andreas.Pfeiffer@dlr.de\">Andreas.Pfeiffer@dlr.de</a> /
<a href=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</a>)<br>
German Aerospace Center (DLR)<br>
<a href=\"https://www.dlr.de/sr/en/desktopdefault.aspx/tabid-11579/\">Institute of System Dynamics and Control</a><br>
Postfach 1116<br>
D-82230 Wessling<br>
GERMANY
</blockquote>

<table border=\"0\" cellpadding=\"2\" cellspacing=\"2\">
<tr><td colspan=\"1\" rowspan=\"2\" style=\"vertical-align: middle;\">
    <img src=\"modelica://eFMI_TestCases/Resources/Images/dlr_logo.png\">
    </td>
    <td style=\"vertical-align: top;\"><br>Licensed by DLR under the <a href=\"https://opensource.org/licenses/BSD-3-Clause\">3-Clause BSD License</a>.</td>
</tr>
<tr><td style=\"vertical-align: top;\"><b>Copyright &copy; 2018-2019, DLR Institute of System Dynamics and Control</b></td>
</tr>
</table>
</html>", revisions="<html>
    <table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
    <tr>
    <th>Date</th>
    <th>Authors</th>
    <th>Change notes</th>
    </tr>
    
    <tr>
    <td valign=\"top\">2018-06-18 to<br>2018-07-13</td>
    <td valign=\"top\">Christoff Bürger (Dassault Systèmes)</td>
    <td valign=\"top\">&bull; Fixed and added icons for plant models and
    controllers.<br>
    &bull; Improved code formatting and diagram layout.<br>
    &bull; Introduced model-abstractions for model reuse and consistency: The
    example contained a lot of code duplication; each test case of the scenario
    - the purely continuous, sampled and embedded case - copied the common whole
    system configuration. Instead, we now have a common scenario as a base-model
    with replaceable controller and for each specific controller implementation
    (continuous, sampled or embedded) a subclass testing that configuration.
    Doing so, consistent test-configuration is ensured. Further, the model code
    is much reduced by still preserving the same functionality. The changes are
    purely software-engineering/model-abstraction improvements; neither the
    equation systems nor simulation parameters are changed. From a
    functional-simulation perspective nothing has changed.<br>
    &bull; Eliminated code duplications, reducing model-lines of code; Test
    cases are now consistent with the base test configuration by design.<br>
    &bull; Made the C-function-bindings replaceable, such that embedded code
    generator developers can bind their generated embedded code solutions in
    sub-models of <code>ControlledPlant_with_C_code</code>.
    </td></tr>
    
    <tr>
    <td valign=\"top\">2018-03-01</td>
    <td valign=\"top\">Andreas Pfeiffer, Martin Otter (DLR)</td>
    <td valign=\"top\">&bull; Initial version.
    </td></tr>
    </table></html>"));
end M04_DrivetrainTorqueControl;

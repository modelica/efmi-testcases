within eFMI_TestCases;
package M03_DCMotorSpeedControl "Example of a DC-motor controlled by a simple PI controller."
  extends Modelica.Icons.ExamplesPackage;




  annotation (preferredView="info", Documentation(info="<html>
<p>
Test case of a very simple model of a DC motor with a load that is controlled
by a very simple controller (a PI controller with output limitations). Note,
in order that the controller is as simple as possible, the PI controller has no
anti-windup part.
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
    <td valign=\"top\">2018-11-16 to<br>2019-01-18</td>
    <td valign=\"top\">Andreas Pfeiffer (DLR)</td>
    <td valign=\"top\">&bull; Introduced new variants with a PID-controller
    instead of a PI-controller<br>
    &bull; Restructuring of the PI controller examples into separate
    sub-packages.
    </td></tr>
    
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
    &bull; Moved parameter modifications to <code>constrainedby</code>-interface,
    such that modifications are consistent by design without need for explicit
    adjustments when sub-classing.<br>
    &bull; Eliminated code duplications, reducing model-lines of code; Test
    cases are now consistent with the base test configuration by design.<br>
    &bull; Made the C-function-bindings replaceable, such that embedded code
    generator developers can bind their generated embedded code solutions in
    sub-models of <code>ControlledPlant_with_C_code</code>.
    </td></tr>
    
    <tr>
    <td valign=\"top\">2018-03-01</td>
    <td valign=\"top\">Andreas Pfeiffer, Martin Otter (DLR)</td>
    <td valign=\"top\">&bull; Initial version of the model.
    </td></tr>
    </table></html>"));
end M03_DCMotorSpeedControl;

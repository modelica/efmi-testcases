within eFMI_TestCases;
package M02_SimplePID "Example of a PID controller for a simple drivetrain with DC motor"
 extends .Modelica.Icons.ExamplesPackage;

annotation (preferredView="info", Documentation(info="<html>
<p>
Test case of a very simple model of a DC motor with a load that is controlled
by a PID controller with output limitations and anti-windup.
</p>

<p>
The goal of this model is to test the eFMI tool chain with a simple, realistic controller that 
has a limitation of the output and might be
used in applications. Note, the PID controller is the one from Modelica.Blocks.Continuous.LimPID,
but modified so that (a) the limiter block in the PID does not introduce a nonlinear system of equations
during initialization (during initalization the limiter is switched off) and (b) the initialization
of differential equations is not performed in steady-state (again to avoid systems of equations and
in order that the initialization does not depend on the inputs).
</p>

<h3>Main Author</h3>

<blockquote>
Ricardo de Castro (German Aerospace Center (DLR),
<a href=\"mailto:Ricardo.DeCastro@dlr.de\">Ricardo.DeCastro@dlr.de</a>)<br>
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
<tr><td style=\"vertical-align: top;\"><b>Copyright &copy; 2019, DLR Institute of System Dynamics and Control</b></td>
</tr>
</table>
</html>"));
end M02_SimplePID;

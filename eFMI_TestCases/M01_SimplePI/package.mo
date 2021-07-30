within eFMI_TestCases;
package M01_SimplePI "Example of a PI controller for a simple DC motor"
  extends .Modelica.Icons.ExamplesPackage;

annotation (preferredView="info", Documentation(info="<html>
<p>
Test case of a very simple model of a DC motor with a load that is controlled
by a very simple controller (a PI controller with output limitations). Note,
in order that the controller is as simple as possible, the PI controller has no
anti-windup part.
</p>

<p>
The goal of this model is to test the eFMI tool chain with an as simple as possible controller.
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
end M01_SimplePI;

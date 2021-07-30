within eFMI_TestCases;
package S003_VehicleModel "Example of a vehicle model (used in the eFMI specification)"
  extends .Modelica.Icons.ExamplesPackage;

annotation(Documentation(info="<html>
<p>
Vehicle model according to \"Section 6.8 Rollover Avoidance\" of the book J. Ackermann et al.: Robust Control, Springer 2002, 
<a href=\"https://www.springer.com/de/book/9781852335144\">https://www.springer.com/de/book/9781852335144</a> and some further assumptions.
</p>

<h3>Main Authors</h3>

<blockquote>
Andreas Pfeiffer and Jakub Tobolar (German Aerospace Center (DLR),<br>
<a href=\"mailto:Andreas.Pfeiffer@dlr.de\">Andreas.Pfeiffer@dlr.de</a>,
<a href=\"mailto:Jakub.Tobolar@dlr.de\">Jakub.Tobolar@dlr.de</a>)<br>
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
end S003_VehicleModel;

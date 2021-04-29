within eFMI_TestCases;
package M08_ZeroCrossingFunctions "Examples for solving nonlinear functions by Brent's algorithm"
   extends Modelica.Icons.ExamplesPackage;



  annotation (preferredView="info", Documentation(info="<html>
<p>
The examples demonstrate how to implement Brent's algorithm in C-code.
The algorithm solves a scalar nonlinear equation f(x) = 0. Therefore, the algorithm needs several evaluations of the nonlinear
function f. The assumption is, that the implementation of the nonlinear model function f is provided by an eFMI model and that
Brent's algorithm is already available in C and is not part of the eFMI model. The task is to incorporate several different
model function (= different eFMI models) and Brent's algorithm in one C project.
</p>

<h3>Main Author</h3>


<blockquote>
Andreas Pfeiffer (German Aerospace Center (DLR),
<a href=\"mailto:Andreas.Pfeiffer@dlr.de\">Andreas.Pfeiffer@dlr.de</a>)<br>
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
end M08_ZeroCrossingFunctions;

within eFMI_TestCases;
package M10_ControlledSliderCrank "Example of a slider crank mechanism  where a nonlinear inverse model of the plant is in the feedforward path of the control system leading to a nonlinear algabraic equation system in the controller"
  extends .Modelica.Icons.ExamplesPackage;

  annotation (
    preferredView = "info",
 Documentation(info="<html>
<p>
The goal of this model is to test the eFMI tool chain whether it can cope with a nonlinear algebraic equation system
in the continuous-time controller. The sampled version of the controller needs then to use an 
appropriate integrator (for example a Rosenbrock integrator).
</p>

<p>
A slider-crank mechanism that is directed in vertical direction. At the top a spring-mass system is present.
</p>

<blockquote>
<img src=\"modelica://eFMI_TestCases/Resources/Images/M10_ControlledSliderCrank/sliderCrank1.png\">
</blockquote>

<p>
The goal is to move the revolute joint of the slider-crank mechanism, such that the mass follows a 
pre-defined path without vibrations. This system is a very simplified model of a molder drive.
When kinematically driving the revolute joint with constant velocity,
the vertical coordinate of the top mass has significant vibrations. 
</p>

<blockquote>
<img src=\"modelica://eFMI_TestCases/Resources/Images/M10_ControlledSliderCrank/sliderCrank2.png\">
</blockquote>

<p>
The controller has an inverse model of the slider crank mechanism in its feedforward path.
This problem is rather challenging, because the inverse model has a nonlinear algebraic equation system.
In order to generated  embedded code for the sampled data controller, an appropriate integrator
has to be used (for example a Rosenbrock integrator). More details are given in
[<i><a href=\"http://www.ep.liu.se/ecp/132/058/ecp17132517.pdf\">Olsson et al. 2017</a></i>, section 4.1].


<h3>Literature</h3>        

<dl>
<dt> Olsson H., Mattsson S.E., Otter M., Pfeiffer A., Bürger C., Henriksson D. (2017):</dt>
<dd> <a href=\"http://www.ep.liu.se/ecp/132/058/ecp17132517.pdf\">Model-based Embedded Control using Rosenbrock Integration Methods</a> (section 4.1),
     Modelica 2017 Conference, Prague, Czech Republic.</dd>
</dl>
      
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
        <tr>
        <td colspan=\"1\" rowspan=\"2\" style=\"vertical-align: middle;\">
    <img src=\"modelica://eFMI_TestCases/Resources/Images/dlr_logo.png\">
    </td>
    <td style=\"vertical-align: top;\">
        <br>Licensed by DLR under the <a href=\"https://opensource.org/licenses/BSD-3-Clause\">3-Clause BSD License</a>.
        </td>
        </tr>
        <tr>
        <td style=\"vertical-align: top;\">
        <b>Copyright &copy; 2018, DLR Institute of System Dynamics and Control</b></td>
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
    <td valign=\"top\">2017-01-01 to<br>2018-10-26</td>
    <td valign=\"top\">Christoff Bürger (Dassault Systèmes)</td>
    <td valign=\"top\">
    &bull; Adaptations for using Rosenbrock methods.<br>
    &bull; Sampling period adjustments to achieve stable, but also efficient
    synchronous simulation.<br>
    &bull; Refinement of out-dated Modelica 3.2 samplings with proper
    synchronous modelling (Modelica 3.3 sampling with clock-inference).<br>
    &bull; Refactoring to enable controller prototyping (replaceable controller
    interface); enables integration of embedded controllers via
    co-simulation.<br>
    &bull; Splitting and decomposition of models in well-documented package
    structure according to Modelica design guidelines.<br>
    &bull; Refactoring for consistent instantiation of continuous and
    synchronous simulation models (reduction of code duplications and improved
    extendibility and variability via well-defined component-slots and
    -modifications).<br>
    &bull; Icons (package, plant models, controllers etc).<br>
    &bull; Diagram layout and code formatting improvements.</td>
    </tr>
    
    <tr>
    <td valign=\"top\">2017-01-01 to<br>2017-05-14</td>
    <td valign=\"top\">Andreas Pfeiffer, Martin Otter (DLR)</td>
    <td valign=\"top\">&bull; Initial continuous and synchronous versions of the
    controlled slider crank.</td>
    </tr>
    </table></html>"));
end M10_ControlledSliderCrank;

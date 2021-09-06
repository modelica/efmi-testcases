within eFMI_TestCases;
package M09_MixingUnit_FBL "Example of a controlled mixing reactor that is controlled by a feedback-linearization controller (uses the non-standard Modelica annotation useAsInputForState)."
  extends .Modelica.Icons.ExamplesPackage;

  annotation (
    preferredView = "info",
    Documentation(info="<html>
<p>
Simple mixing unit [<i>Föllinger 1998</i>] that is controlled by a <b>feedback-linearization</b> controller
(a nonlinear inverse model of the plant is used in the <b>feedback path</b> of the controller).
In order to define this controller, the non-standard Modelica annotation <b>useAsInputForState</b>
is used in model <a href=\"modelica://eFMI_TestCases.M09_ControlledMixingUnit_FeedbackLinearization.Utilities.InputToState\">Utilitizes.InputToState</a>.
Currently, this example simulates only in Dymola (version &ge; 2019 FD01).
</p>

<p>
The plant model is a copy from
<a href=\"modelica://Modelica.Clocked.Examples.Systems.ControlledMixingUnit\">Modelica.Clocked.Examples.Systems.ControlledMixingUnit</a>:
A substance A is flowing continuously into a mixing reactor.
Due to a catalyst, the substance reacts and splits into several base
substances that are continuously removed. The reaction generates
energy and therefore the reactor is cooled with a cooling medium.
The cooling temperature T_c(t) in [K] is the primary actuation signal.
Substance A is described by its concentration c(t) in [mol/l] and
its temperature T(t) in [K].
The concentration c(t) is the signal to be primarily controlled
and the temperature T(t) is the signal that is measured.
These equations are collected together in input/output block
<a href=\"modelica://eFMI_TestCases.M05_ControlledMixingUnit.PlantModels.MixingUnit\">PlantModels.MixingUnit</a>.
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Clocked/Examples/ControlledMixingUnit_PlantModel.png\">
</blockquote>

<p>
The approach to model this feedback linearization controller in Modelica is described in
[<i><a href=\"http://www.ep.liu.se/ecp/132/058/ecp17132517.pdf\">Olsson et al. 2017</a></i>, section 4.2].
</p>

        
<h3>Literature</h3>        

<dl>
<dt> Föllinger O. (1998):</dt>
<dd><b>Nichtlineare Regelungen I</b>, Oldenbourg Verlag, 8. Auflage, page 279.</dd>

<dt> Olsson H., Mattsson S.E., Otter M., Pfeiffer A., Bürger C., Henriksson D. (2017):</dt>
<dd> <a href=\"http://www.ep.liu.se/ecp/132/058/ecp17132517.pdf\">Model-based Embedded Control using Rosenbrock Integration Methods</a> (section 4.2),
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
        <b>Copyright &copy; 2018-2019, DLR Institute of System Dynamics and Control</b></td>
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
    &bull; Support for mapping controller inputs to an internal state of the
    controller (<code>InputToState</code>-model and
    <code>useAsInputForState</code>-annotation). Such mappings are required by
    the example to enable generation and co-simulation of embedded
    controllers.<br>
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
    <td valign=\"top\">&bull; Initial continuous and synchronous versions of
    the controlled mixing unit with feeback linearization-based controller.</td>
    </tr>
    </table></html>"));
end M09_MixingUnit_FBL;

within eFMI_TestCases;
package M05_ControlledMixingUnit "Example of a controlled mixing reactor where a nonlinear inverse model of the plant is in the feedforward path of the control system."
  extends .Modelica.Icons.ExamplesPackage;

  annotation (
    preferredView = "info",
    Documentation(info="<html>
<p>
Control of a simple mixing unit [<i>Föllinger 1998</i>] where the <b>inverse model of the nonlinear
plant</b> is used as feedforward control. The feedback control is a simple P-controller.
This example is derived from
<a href=\"modelica://Modelica_Synchronous.Examples.Systems.ControlledMixingUnit\">Modelica_Synchronous.Examples.Systems.ControlledMixingUnit</a>
where all details are described.

<p>
Plant model: A substance A is flowing continuously into a mixing reactor.
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
<img src=\"modelica://Modelica_Synchronous/Resources/Images/Examples/ControlledMixingUnit_PlantModel.png\">
</blockquote>


<h3>Literature</h3>        

<dl>
<dt> Föllinger O. (1998):</dt>
<dd><b>Nichtlineare Regelungen I</b>, Oldenbourg Verlag, 8. Auflage, page 279.</dd>
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
    controlled mixing unit, based on the
    <a href=\"modelica://Modelica_Synchronous.Examples.Systems.ControlledMixingUnit\">
    mixing reactor</a> example of <code>Modelica_Synchronous</code>.</td>
    </tr>
    </table></html>"));
end M05_ControlledMixingUnit;

within eFMI_TestCases;
package M15_AirSystem "Example of an (academic) engine air system"
  extends .Modelica.Icons.ExamplesPackage;

    annotation (preferredView="info", Documentation(info="<html>
<p>The model contained in this package reflects the dynamics of an intake air manifold as well as fuel injection and crank shaft dynamics in a spark ignition engine. It is a well-known benchmark model for engine modelling and control called mean value engine model (MVEM). The implementation follows the equations given in [1] and [2] (and on a limited basis also [3]). </p>
<p>The two inputs of this simulation model are the throttle angle <i>v</i> and the injected fuel mass flow rate <i>m_dot_f_i</i> respectively. <i>AFR</i> is the output of the model. The manifold temperature <i>T_i</i>, the manifold pressure <i>P_i</i> and the crank shaft speed <i>n</i> are the measurable intermediate variables of the AFR system. </p>
<blockquote><img src=\"modelica://eFMI_TestCases/Resources/Images/M15_AirSystem/M15_AirSystem_sketch.png\"/></blockquote>
<blockquote><b>Fig. 1</b> Sketch of the engine model structure according to [1]. </blockquote>
<p>Fig. 1 depicts a sketch of the model structure. The time delay subsystem in the figure is without any great significance and is left away in this reimplementation. The connections between the subsystems are single signal connections instead of physical ports. </p>
<p><b>1. AirSystem_ExplEuler:</b> </p>
<p>The test with the explicit Euler fixed-step solver reflects the default embedded application at the cost of a very small solver step size of 1e-3s to get stable results. </p>
<p><b>2. AirSystem_Rosenbrock1:</b> </p>
<p>The Rosenbrock method allows a much larger setp size than the explicit Euler (up to 0.1s) to get stable results. In the test the step size has been limited to the value of the time delay to get the same behavior.</p>
<p><b>3. AirSystem_FixedStep_ImplEuler:</b> </p>
<p>The implicit fixed-step solver also allows a significantly larger step size of 1e-2s than the explicit Euler, but leads to a non-linear equation system and is therefore not applicable for an embedded device.</p>
<p>Currently the compiler gives a warning in the inline variant:</p>
<p>&quot;<i>Delay operator, delay(airSystem.fuel_Injection.m_dot_f, airSystem.engine_Speed.del_tau_d), found in conditional code. It will only store the delayed result when active.</i>&quot;</p>
<p>According to DS the inline integrated solver is considered as conditional (because its code contains conditions), which in turn makes the delay conditional. The warning now indicates that the parametric expression of the delay must be a proper multitude of the fixed step size, otherwise the delay will not work as expected. Since this is the case for this model one can ignore the warning. </p>
<p><b>3. AirSystem_Dassl: </b></p>
<p>The variable Dassl solver is not applicable for an embedded device but serves as the quasi-continuous time reference solution.</p>
<p><br><b><span style=\"font-size: 14pt;\">Literature</span></b> </p>
<table cellspacing=\"8\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>[1]</p></td>
<td><p>Zhai, Y.-J.; Yu, D.-L.: <i>Neural network model-based automotive engine air/fuel ratio control and robustness evaluation.</i> In: Engineering Applications of Artificial Intelligence 22, 2009, pp. 171-180. </p></td>
</tr>
<tr>
<td><p>[2]</p></td>
<td><p>Shi, Yi; Yu, D.-L.; Tiana, Y.; Shi, Ya.: <i>Air&ndash;fuel ratio prediction and NMPC for SI engines with modified Volterra model and RBF network.</i> In: Engineering Applications of Artificial Intelligence 45, 2015, pp. 313-324. </p></td>
</tr>
<tr>
<td><p>[3]</p></td>
<td><p>Crossley, P.R.; Cook, J.A.: <i>A Nonlinear Engine Model for Drivetrain System Development.</i> In: Inst. Elect. Eng. Conference &apos;Control 91&apos;, Edinburgh, U.K., Publication 332, Vol. 2, 1991, pp. 921&ndash;925. </p></td>
</tr>
</table>
<p><br><br><br><br><b><span style=\"font-size: 14pt;\">Main Author</span></b></p>
<p>Oliver Lenord (<a href=\"mailto:oliver.lenord@de.bosch.com\">oliver.lenord@de.bosch.com</a>)</p>
<p>Christian Potthast (<a href=\"mailto:christian.potthast@de.bosch.com\">christian.potthast@de.bosch.com</a>) </p>
<blockquote><br><a href=\"https://www.bosch.de/\">Robert Bosch GmbH</a></blockquote>
<blockquote><br><a href=\"https://www.bosch.com/research/\">Corporate Sector Research and Advance Engineering</a></blockquote>
<blockquote><br>Virtual Prototypes and Simulation (CR/AEE3)</blockquote>
<blockquote><br>D-71272 Renningen</blockquote>
<blockquote><br>GERMANY</blockquote>
<table cellspacing=\"2\" cellpadding=\"2\" border=\"0\"><tr>
<td valign=\"middle\"><p><img src=\"modelica://eFMI_TestCases/Resources/Images/bosch_logo.png\"/> </p></td>
<td valign=\"top\"><p><br>Licensed by Robert Bosch GmbH under the <a href=\"https://opensource.org/licenses/BSD-3-Clause\">3-Clause BSD License</a></p><p><br>Copyright &copy; 2019, Robert Bosch GmbH</p></td>
</tr>
</table>
</html>"));
end M15_AirSystem;

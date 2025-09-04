within eFMI_TestCases;
package M11_NeuralQVM
  extends .Modelica.Icons.ExamplesPackage;

  annotation (
    preferredView = "info",
    Documentation(info="<html>
This example is a prediction model for the vertical dynamics of a quarter
vehicle model (QVM). To incorporate the unknown non-linear behavior of
the suspension (spring and damper), neural networks are trained which add
the correct non-linear behavior to the equation-based modeled linear
physics. The resulting predictor is a PeN-ODE, a physics enhanced neural
ordinary differential equation.
<p>
The final objective is to generate embedded code for the whole predictor,
including the physics and artificial neural networks (NN), whereas the NN
parameters (weights and biases) shall be tunable at runtime such that
updated versions of the non-linear behavior can be deployed (assuming the
NN architecture like number of layers and parameters per layer stay the
same). A major challenge of the embedded code generation is to preserve
the tensor-flow as multi-dimensional GALEC expressions throughout symbolic
optimization of the model equations, since a Modelica-tooling typical
scalarization would cause a code size explosion.
<p>
Due to intellectual property considerations, the NNs of the example have
been trained using synthetic and not real measurement data.

<h3>References</h3>

The example, and in particular its challenges regarding the embedded
domain, are described in detail in:
<blockquote>
Tobias Kamp, Christoff Bürger, Johannes Rein, Jonathan Brembeck.<br>
<i>Hybrid Simulation Models for Embedded Applications: A Modelica and eFMI approach</i>.<br>
16th International Modelica Conference, September 8-10th 2025, Lucerne, Switzerland.<br>
<a href=\"modelica://eFMI_TestCases/Resources/Documentation/M11-modelica-2025-paper.pdf\">doi</a>, <a href=\"modelica://eFMI_TestCases/Resources/Documentation/M11-modelica-2025-paper.pdf\">paper (pdf)</a>
</blockquote>

The example has been tested on a real vehicle; the setup is described in:
<blockquote>
Julian Ruggaber, Kenan Ahmic, Jonathan Brembeck, Daniel Baumgartner, Jakub Tobolár.<br>
<i>AI-For-Mobility: A New Research Platform for AI-Based Control Methods</i>.<br>
Applied Sciences 13.5.<br>
<a href=\"https://doi.org/10.3390/app13052879\">doi</a>, <a href=\"modelica://eFMI_TestCases/Resources/Documentation/M11-reference-1.pdf\">paper (pdf)</a>
</blockquote>

A general overview of vertical dynamics of QVMs is given in:
<blockquote>
Michael Fleps-Dezasse, Jonathan Brembeck.<br>
<i>Model based vertical dynamics estimation with Modelica and FMI</i>.<br>
IFAC Proceedings Volumes 46.21, pp. 341–346.<br>
<a href=\"https://doi.org/10.3182/20130904-4-jp-2042.00086\">doi</a>, <a href=\"modelica://eFMI_TestCases/Resources/Documentation/M11-reference-2.pdf\">paper (pdf)</a>
</blockquote>

The training of the PeN-ODE is described in:
<blockquote>
Tobias Kamp, Johannes Ultsch, Jonathan Brembeck.<br>
<i>Closing the Sim-to-Real Gap with Physics-enhanced Neural ODEs</i>.<br>
Proceedings of the 20th International Conference on Informatics in Control, Automation and Robotics. SCITEPRESS - Science and Technology Publications.<br>
<a href=\"https://doi.org/10.5220/0012160100003543\">doi</a>, <a href=\"modelica://eFMI_TestCases/Resources/Documentation/M11-reference-3.pdf\">paper (pdf)</a>
</blockquote>

Previous work on embedding prediction models for the vertical dynamics
of QVMs is given in:
<blockquote>
Johannes Ultsch, Julian Ruggaber, Andreas Pfeiffer, Christina Schreppel, Jakub Tobolár, Jonathan Brembeck, Daniel Baumgartner.<br>
<i>Advanced Controller Development Based on eFMI with Applications to Automotive Vertical Dynamics Control</i>.<br>
Actuators 10.11.<br>
<a href=\"https://doi.org/10.3390/act10110301\">doi</a>, <a href=\"modelica://eFMI_TestCases/Resources/Documentation/M11-reference-4.pdf\">paper (pdf)</a>
</blockquote>
In opposite to this example, above reference uses a Kalman filter
approach to incorporate the unknown non-linearities of the suspension.

<p>

A general overview for the application of reinforcement learning to train
the vertical dynamics of QVMs is given in:
<blockquote>
Johannes Ultsch, Andreas Pfeiffer, Julian Ruggaber, Tobias Kamp, Jonathan Brembeck, Jakub Tobolár.<br>
<i>Reinforcement Learning for Semi-Active Vertical Dynamics Control with Real-World Tests</i>.<br>
Applied Sciences 14.16.<br>
<a href=\"https://doi.org/10.3390/app14167066\">doi</a>, <a href=\"modelica://eFMI_TestCases/Resources/Documentation/M11-reference-5.pdf\">paper (pdf)</a>
</blockquote>
In opposite to this example, above reference does not yet use proper
PeN-ODEs where actual physics-equations constrain and guide the training.

<p>

This example has been developed within the scope of the
<a href=\"https://itea4.org/project/openscaling.html\">ITEA 4 Project 22013, OpenSCALING</a>
(November 2023 - January 2027).

<h3>Authors</h3>

<blockquote>      
Tobias Kamp, Johannes Rein (German Aerospace Center (DLR),
<a href=\"mailto:tobias.kamp@dlr.de\">tobias.kamp@dlr.de</a> /
<a href=\"mailto:johannes.rein@dlr.de\">johannes.rein@dlr.de</a>)
and Christoff Bürger (Dassault Systèmes,
<a href=\"mailto:christoff.buerger@3ds.com\">christoff.buerger@3ds.com</a>)
</blockquote>

<table border=\"0\" cellpadding=\"2\" cellspacing=\"2\">
<tr>
<td colspan=\"1\" rowspan=\"2\" style=\"vertical-align: middle;\">
<img src=\"modelica://eFMI_TestCases/Resources/Images/dlr_logo.png\"><br>
<img src=\"modelica://eFMI_TestCases/Resources/Images/ds-logo.png\" width=\"140\" height=\"44\">
</td>
<td style=\"vertical-align: top;\">
<br>Licensed by DLR and Dassault Systèmes under the
<a href=\"https://opensource.org/licenses/BSD-3-Clause\">3-Clause BSD License</a>.
</td>
</tr>
<tr>
<td style=\"vertical-align: top;\">
<b>Copyright &copy; 2025, DLR, Dassault Systèmes</b></td>
</tr>
</table>

</html>"));
end M11_NeuralQVM;

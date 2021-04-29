within eFMI_TestCases;
package M14_Rectifier "Examples for ideal rectifier implementations"
  extends Modelica.Icons.ExamplesPackage;


  annotation (preferredView="info", Documentation(info="<html>
<p>This is test case of a simple rectifier model used within a generator circuit charging a battery. The rectifier implementation reflects an ideal switching behavior of the connections between the left and right pins depending on the current flow direction. </p>
<blockquote><img src=\"modelica://eFMI_TestCases/M14_Rectifier/Resources/Images/GeneratorModel_Illustration_reduced_small.png\"/> </blockquote>
<p>Idealizing the rectifier behavior, the above system is reduced to the ordinary differential equation (ODE) </p>
<blockquote><img src=\"modelica://eFMI_TestCases/M14_Rectifier/Resources/Images/generator_ODE.png\"/> </blockquote>
<p>where <i>U_R</i> is the voltage drop over the resistor. The battery voltage <i>U_Bat</i> and the ideal generatior voltage <i>U_Ideal</i> are inputs to the model. </p>
<p>The goal of this testcase is to evaluate the eFMU code compactness. Former tests with FMU export of M14_Rectifier.Generators.Generator&apos; model show unnecessarily bloated code for the generator. The second example model &apos;M14_Rectifier.Generators.Generator_Modelica&apos; uses the above mentioned ODE formulation for the generator as one monolithic component. The third example model &apos;M14_Rectifier.Generators.Generator_C_Code&apos; uses manually optimized C-code for the right-hand-side of the generator ODE. </p>
<p>The models to be exportetd as eFMU are: </p>
<ul>
<li>M14_Rectifier.Generators.Generator</li>
<li>M14_Rectifier.Generators.GeneratorMonolithic_Modelica </li>
</ul>
<p><b>Recommended solver settings:</b> (for both example models) </p>
<table cellspacing=\"1\" cellpadding=\"0\" border=\"0.5\"><tr>
<td><p>&nbsp;Start time [s]:&nbsp;</p></td>
<td><p>&nbsp;0&nbsp;</p></td>
</tr>
<tr>
<td><p>&nbsp;Stop time [s]:&nbsp;</p></td>
<td><p>&nbsp;3&nbsp;</p></td>
</tr>
<tr>
<td><p>&nbsp;Number of output intervals:&nbsp;</p></td>
<td><p>&nbsp;3600&nbsp;</p></td>
</tr>
<tr>
<td><p>&nbsp;Algorithm:&nbsp;</p></td>
<td><p>&nbsp;Euler&nbsp;</p></td>
</tr>
<tr>
<td><p>&nbsp;Integrator step size [s]:&nbsp;</p></td>
<td><p>&nbsp;1e-3&nbsp;</p></td>
</tr>
</table>
<p><br><br><br><b><span style=\"font-size: 12pt;\">Main Author</span></b></p>
<p>Christian Potthast (<a href=\"mailto:christian.potthast@de.bosch.com\">christian.potthast@de.bosch.com</a>) </p>
<p>Oliver Lenord (<a href=\"mailto:oliver.lenord@de.bosch.com\">oliver.lenord@de.bosch.com</a>)</p>
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
end M14_Rectifier;

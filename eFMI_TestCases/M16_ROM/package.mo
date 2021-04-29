within eFMI_TestCases;
package M16_ROM "Example for a reduced order model (ROM) of thermal heat transfer"
    extends Modelica.Icons.ExamplesPackage;

  annotation (preferredView="info", Documentation(info="<html>
<p>This is a test model for a linear, time-variant differential algebraic equation system in the following form: </p>
<blockquote><br><img src=\"modelica://eFMI_TestCases/M16_ROM/Resources/Images/DAE_eq_system.png\" alt=\"E * der(x) = A * x + B* u\"/> </blockquote>
<p><i>E</i> and <i>A</i> are 22x22 matrices. <i>E</i> ist constant, <i>A</i> and <i>B</i> vary with time. </p>
<p>The model output equation</p>
<p style=\"margin-left: 30px;\"><img src=\"modelica://eFMI_TestCases/M16_ROM/Resources/Images/output_equation.png\" alt=\"y = C * x\"/></p>
<p>reduces the vector of the quantities of interest <i>y</i> to 12 elements, i.e. <i>C</i> is a 12x22 matrix. </p>
<p>Problems like these arise in thermal network applications with applied model order reduction methods. Accordingly the ouput vector <i>y</i> represents temperatures at certain nodes of the system under consideration. </p>
<p><br><br>It is important to choose the <b>implicit</b> Euler solver which leads to large linear system to be solved but allows a large time step of 0.1 s for this test case. The explict Euler solver requires very small time steps which are unfeasible for the desired realtime application on an ECU. (Tests in Dymola with an explicit Euler lead to instable behaviour for time steps &ge; 2.5E-5 s.) </p>
<p><b><span style=\"font-size: 14pt;\">Main Author</span></b></p>
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
end M16_ROM;

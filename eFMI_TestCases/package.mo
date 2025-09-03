within ;
package eFMI_TestCases "eFMI_TestCases: Official MAP eFMI library with test-scenarios for evaluating
   and crosschecking eFMI tooling."
  extends .Modelica.Icons.Package;

  extends .eFMI.Icons.eFMI;

  annotation (
    preferredView="info",
    version="1.0.2",
    Protection(
      __Dymola_showFlat = true,
      access = Access.packageDuplicate),
    uses(
      Modelica(version="4.1.0"),
      eFMI(version="1.0.2")),
    Documentation(info="<html>
<p>Library <b>eFMI_TestCases</b> provides application scenarios for evaluating and crosschecking <a href=\"https://efmi-standard.org/\">eFMI</a> tooling. It is officially released and maintained by the <a href=\"https://efmi-standard.org/\">MAP eFMI</a> in accordance with new releases of the eFMI standard.</p>
<p>The individual application scenarios are the libraries&apos; direct subpackages M01 - M25 and S001 - S003; each package is one application scenario.</p>
<p>Please consult the <a href=\"modelica://eFMI_TestCases.UsersGuide\">user&apos;s guide</a> for an overview of the <u><i>application scenario template</i></u> used by all scenarios; the template ensures a common structure, components, test setup and eFMI tooling integration. The <u><i>application scenario specific domain and objectives</i></u> are documented individually in each scenario&apos;s package.</p>
<p><b>Authors:</b> The individual application scenarios are developed by different authors, mostly by DLR-SR and Robert Bosch GmbH. The library, its application scenario template and scripting is maintained by:</p>
<ul>
<li><b>Library officer:</b> Christoff B&uuml;rger (Dassault Syst&egrave;mes AB, <a href=\"mailto:Christoff.Buerger@3ds.com\">Christoff.Buerger@3ds.com</a>)</li>
<li><b>Deputy library officer:</b> Andreas Pfeiffer (DLR-SR, <a href=\"mailto:Andreas.Pfeiffer@dlr.de\">Andreas.Pfeiffer@dlr.de</a>)</li>
</ul>
<p><b>Licensed under the <a href=\"https://opensource.org/licenses/BSD-3-Clause\">3-Clause BSD License</a></b></p>
<p>Copyright &copy; 2017-2025, <a href=\"https://www.3ds.com/\">Dassault Syst&egrave;mes</a>, <a href=\"https://www.dlr.de/sr/en\">DLR-SR</a>, <a href=\"https://www.bosch.de/\">Robert Bosch GmbH</a>, <a href=\"https://modelica.org/\">Modelica Association and contributors</a>. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the 3-Clause BSD license. For license conditions (including the disclaimer of warranty) visit <a href=\"https://opensource.org/licenses/BSD-3-Clause\">https://opensource.org/licenses/BSD-3-Clause</a>.</i> </p>
<p><b>Modelica&reg;</b> is a registered trademark of the Modelica Association.</p>
<p><b>eFMI&reg;</b> is a registered trademark of the Modelica Association.</p>
<p><b>FMI&reg;</b> is a registered trademark of the Modelica Association.</p>
</html>"));
end eFMI_TestCases;

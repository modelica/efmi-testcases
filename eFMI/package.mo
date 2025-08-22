within ;
package eFMI "eFMI: Support library to ease preparing Modelica models for eFMI tooling."
  extends .Modelica.Icons.Package;

  extends .eFMI.Icons.eFMI;

  annotation (
    preferredView="info",
    version="1.0.2",
    Protection(
      __Dymola_showFlat = true,
      access = Access.packageDuplicate),
    uses(Modelica(version="4.1.0")),
    Documentation(info="<html>
<p>Library <b>eFMI</b> provides Modelica Standard Library table-adapters and GALEC builtin function implementations to ease migration of Modelica models for <a href=\"https://efmi-standard.org/\">eFMI</a> tooling. It is officially released and maintained by the <a href=\"https://efmi-standard.org/\">MAP eFMI</a> in accordance with new releases of the eFMI standard.</p>
<h4>Authors:</h4>
<ul>
<li><b>Library officer:</b> Christoff B&uuml;rger (Dassault Syst&egrave;mes AB, <a href=\"mailto:Christoff.Buerger@3ds.com\">Christoff.Buerger@3ds.com</a>)</li>
<li><b>Deputy library officer:</b> Andreas Pfeiffer (DLR, <a href=\"mailto:Andreas.Pfeiffer@dlr.de\">Andreas.Pfeiffer@dlr.de</a>)</li>
</ul>
<p><b>Licensed under the <a href=\"https://opensource.org/licenses/BSD-3-Clause\">3-Clause BSD License</a></b></p>
<p>Copyright &copy; 2017-2025, <a href=\"https://www.3ds.com/\">Dassault Syst&egrave;mes</a>, <a href=\"https://www.dlr.de/sr/en\">DLR-SR</a>, <a href=\"https://modelica.org/\">Modelica Association and contributors</a>.</p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the 3-Clause BSD license. For license conditions (including the disclaimer of warranty) visit <a href=\"https://opensource.org/licenses/BSD-3-Clause\">https://opensource.org/licenses/BSD-3-Clause</a>.</i> </p>
<p><b>Modelica&reg;</b> is a registered trademark of the Modelica Association.</p>
<p><b>eFMI&reg;</b> is a registered trademark of the Modelica Association.</p>
<p><b>FMI&reg;</b> is a registered trademark of the Modelica Association.</p>
</html>"));
end eFMI;

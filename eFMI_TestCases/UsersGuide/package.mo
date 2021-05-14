within eFMI_TestCases;
package UsersGuide "User's Guide"
  extends Modelica.Icons.Information;

  annotation (
    DocumentationClass = true,
    Documentation(info="<html>
<p>The application scenarios of this library are organized according to an <u><i>application scenario template</i></u>. The template ensures a common structure, components, test setup and eFMI tooling integration across all application scenarios, such that users can easily utilize the library once the template is understood; this common structure is optimized for automatic crosschecking to evaluate and validate eFMI tooling.</p>
<p>For application scenario specific domain documentation please consult the individual scenario packages; the following user&apos;s guide is only about the application scenario template.</p>
<h4>Common package structure</h4>
<p>Each application scenario contains the following common subpackages:</p>
<ol>
<li><b>Controllers</b> (mandatory): The models actually subject to eFMU generation. This are not necessarily controllers. It can be models for prediction or diagnosis etc; anything that is part of the embedded software deployed on the cyber-physical system modeled in the application scenario. For brevity, the models subject to eFMU generation are called <u><i>eFMU blocks</i></u>.</li>
<li><b>PlantModels</b> (optional): Plant models for the different parts of the cyber-physical system, i.e., the physics-modelling of every individual system part except the eFMU blocks.</li>
<li><b>TestSetups</b> (mandatory): Models defining the different <u><i>physics test configurations</i></u> of the application scenario, like open or closed loop tests, varying test stimuli or the different plant model configurations that have to be supported by eFMU blocks. The models of a <b>TestSetups</b> package define all whole system configurations of the application scenario&apos;s cyber-physical system and its environment. Note the emphasizes on <i>physics</i> test configurations; models of <b>TestSetups</b> are about configuring the whole system physics, not pure simulation/implementation options like the used solver methods or floating point precision. The physics test configurations defined in a <b>TestSetups</b> package are reused in turn by the <b>Tests</b> and <b>ReferenceTests</b> packages to derive via model extension further models for evaluating varying implementations of eFMU blocks and define reference results for such.</li>
<li><b>Tests</b> (mandatory): Models testing the eFMU generation capabilities of eFMI tooling, i.e., the different <u><i>eFMU test configurations</i></u>. Each eFMU test configuration is derived from a <b>TestSetups</b> model by selecting all concrete simulation options that influence eFMU code generation for one or several of the application scenario&apos;s eFMU blocks; this are the solver methods and sampling times of the clocked partitions encapsulating eFMU blocks. Each <b>Tests</b> model thereby defines another eFMU implementation-variant that is tested. The model&apos;s documentation must clarify for which eFMU block(s) a variant is defined if it contains several eFMU block components.</li>
<li><b>ReferenceTests</b> (mandatory): Models used to generate expected reference results, i.e., <u><i>behavioral test configurations</i></u>. Reference results are used to add respective Behavioral Model containers to generated eFMUs; each <b>ReferenceTests</b> model thereby defines one test scenario. <b>ReferenceTests</b> models are derived from <b>TestSetups</b> models by adding an interval in which reference results are sampled, defining the variables that are to be tested (typically all eFMU block inputs and outputs) and acceptable tolerances for the tested variables.<br></li>
</ol>
<h4>Controllers package restrictions</h4>
<p><u><i>Well-defined eFMU block interface:</i></u> eFMU blocks must be a Modelica <span style=\"font-family: Courier New;\">block</span> (not <span style=\"font-family: Courier New;\">model</span> or <span style=\"font-family: Courier New;\">connector</span>) with explicit input and output interface. The top-level parameters of eFMU blocks have a special semantic for eFMI GALEC code generation: the top-level parameters with literal values, or simple expressions constructed from literals and constants, will become tuneable parameters in the GALEC code generated for the eFMU block. And only these parameters will become tuneable parameters; parameters of nested components will not, even if they are set to simple literals. These parameters togeher with the eFMU block&apos;s in- and outputs therefore define the GALEC code&apos;s block interface.</p>
<p><u><i>No outerscope eFMU block modifications:</i></u> Instances of models used as eFMU blocks must never be modified (neither by <b>TestSetups</b> nor <b>Tests</b> models). The reason is, that eFMI tooling can generate eFMU GALEC code from <i>the very</i> eFMU block model, and thereby miss later modifications. But modifications in Modelica can have arbitrary consequences for the <i>semantics</i> of generated GALEC code. Modifying the range of a variable for example has consequences for the saturation behavior enforced by the GALEC language; modifying parameters can change the set of tuneable and dependent parameters; changing start values yields different embedded initializations which is relevant for embedded system integration. In other words, every modification can yield a completely new controller in terms of eFMI. The idea of eFMU blocks is to be <i>reuseable</i> embedded implementations however, whereas reuse here means: used <i>as is</i> in different contexts. In terms of Modelica, this corresponds to <i>consistent</i> multiple instanziation of eFMU blocks. <b>ReferenceTests</b> models are relying on such consistent instanziation because they define the behavior of a <i>certain</i> eFMU block in different test scenarios (thus, the very same eFMU block shall be tested under varying environment conditions).</p>
<h4>TestSetups package restrictions</h4>
<p><u><i>SiL simulation prepared models:</i></u> All eFMU block instances shall be replaceable. This enables eFMU co-simulation by replacing the Modelica-modeled blocks with respective eFMU implementations for software-in-the-loop simulation (SiL).</p>
<p><u><i>Consistent, all-embracing physics models:</i></u> All <b>Tests</b> and <b>ReferenceTests</b> models must be derived from models of <b>TestSetups</b> by inheritance and they must not introduce any new components or connections. In other words, <b>TestSetups</b> models configure the physics of the application scenario whereas <b>Tests</b> and <b>ReferenceTests</b> models only configure eFMU and reference result generation respectively; neither introduces new physics or application scenario semantics.</p>
<p><u><i>Uniform continuous and sampled system modelling:</i></u> Physics test configrations typically have to be prepared for clocked and non-clocked simulation as required for their later refinement to eFMU and behavioral test configurations. To that end, models of the <b>TestSetups</b> package often have to be provided in both, a purely continuous variant and a variant where eFMU blocks are sampled. To ensure consistency between clocked and continuous variants regarding the modeled physics, both are modeled together using conditional declarations via a Boolean <span style=\"font-family: Courier New;\">is_clocked</span> parameter. For each input and output of eFMU block instances, conditionally declared sampling constructs are introduced. The connections with eFMU block instances are also conditional, either via their respective conditional sampling constructs or directly, depending whether <span style=\"font-family: Courier New;\">is_clocked</span> is <i>true</i> or <i>false</i>. Derived eFMU and test configurations can now modify <span style=\"font-family: Courier New;\">is_clocked</span> as required. This patter is supported by the <span style=\"font-family: Courier New;\">Utilities.ClockedContinuousTwin</span> class; whenever continuous <i>and</i> clocked model variants are required, the respective models shall inherite from <span style=\"font-family: Courier New;\">ClockedContinuousTwin</span> and use its <span style=\"font-family: Courier New;\">is_clocked</span> parameter to define the required conditional declarations described above.</p>
<h4>Tests package restrictions</h4>
<p><u><i>eFMI tooling suiteable sampling of eFMU blocks:</i></u> Each eFMU block instance for which an eFMU test configuration is defined must be part of an individual clocked partitions; only periodic clocks can be used for such (no event clocks or exact periodic clocks). Using sub- and super-sampling is fine (the eFMI interpretation of such is that they introduce furher <i>periodic</i> -- not exact -- clocked partitions for their contained eFMU block). eFMU block instances further must be connected to samplings, holds, sub- or super-samplings <i>only</i>. This ensures that besides the eFMU block instance no further semantic is added to its clocked partition, such that eFMI capable Modelica tooling can derive eFMI GALEC code for an eFMU block based on its clocked usage.</p>
<p><u><i>Automatic eFMU generation prepared models:</i></u> Each model must provide the following annotations to enable Modelica tools to automatically generate respective eFMUs for each eFMU test configuration: </p>
<ul>
<li>annotation <span style=\"font-family: Courier New;\">__iti_namesAtInterface</span> to define the interface variables in the clocked system for the export (e.g. by SimulationX),</li>
<li>annotation <span style=\"font-family: Courier New;\">__fmi_modelExportName</span> to define the name of the exported eFMU this model defines,</li>
<li>annotation <span style=\"font-family: Courier New;\">__fmi_sourceModel</span> to define the path and name of the continuous model being exported as eFMU (e.g. by Dymola).</li>
</ul>
<h4>Additional ReferenceTests package restrictions</h4>
<p><u><i>Automatic reference result generation prepared models:</i></u> Models shall be executable, with proper experiment annotations. Further, each model shall provide the following annotations to enable the generation of eFMI Behavioral Model containers:</p>
<ul>
<li>annotations for experiment and simulation setup (e.g. output interval, solver) to enble the reproduction of the reference results</li>
<li>annotations <span style=\"font-family: Courier New;\">__fmi_InterfaceVariable </span>to define </li>
<li><ul>
<li>the interface variables to be considered in the reference data,</li>
<li>the mapping of the Modelica variable names in the test model to the eFMI variable names of the exported block used in the reference file,</li>
<li>the causality of the variables,</li>
<li>the error tolerance to be considered to compute the upper and lower limits for each variable,</li>
</ul></li>
<li>annotation <span style=\"font-family: Courier New;\">__fmi_OriginalModel_ExportReference</span> to define the name of the model class in the Test package that is used for the eFMU export. Several reference test models may have an identical entry here, i.e. several scenarios are defined in the corresponding exported eFMI Behavioral model.</li>
</ul>
<p><u><i>Meaningful embedded testing:</i></u> The reference results shall:</p>
<ul>
<li>have double precision</li>
<li>use a constant time grid corresponding to the sample rate</li>
<li>not use outputs at events, as this may cause trouble in the importing tools</li>
<li>capture all inputs and outputs of the eFMU block</li>
<li>be exported in .csv format</li>
<li>not exceed the size of 25.000 data points to ensure that it can be stored without problems on an ECU,<br>sim_time &lt;= 25000 * dt / num(vars), e.g. with 2 inputs and 3 outputs at a sample rate of 1ms the total time should be at most 25000/1000/5 = 5s</li>
</ul>
</html>"));
end UsersGuide;
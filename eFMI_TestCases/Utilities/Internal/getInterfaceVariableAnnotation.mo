within eFMI_TestCases.Utilities.Internal;
function getInterfaceVariableAnnotation "Returns the content of the annotation __fmi_InterfaceVariable"
  input String modelName;
  output String annot;
  output Boolean ok;

algorithm

  annot := ModelManagement.Structure.AST.GetAnnotation(modelName, "__fmi_InterfaceVariable");
  ok := (Modelica.Utilities.Strings.length(annot) >= 10);

annotation(__Dymola_interactive=true);
end getInterfaceVariableAnnotation;

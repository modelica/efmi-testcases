within eFMI_TestCases.Utilities.Internal;
function getNameAtInterfaceAnnotation "Returns the content of the annotation __iti_namesAtInterface"
  input String modelName;
  output String annot;
  output Boolean ok;

algorithm

  annot := ModelManagement.Structure.AST.GetAnnotation(modelName, "__iti_namesAtInterface");
  ok := (Modelica.Utilities.Strings.length(annot) >= 10);

annotation(__Dymola_interactive=true);
end getNameAtInterfaceAnnotation;

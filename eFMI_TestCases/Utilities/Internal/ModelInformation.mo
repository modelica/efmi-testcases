within eFMI_TestCases.Utilities.Internal;
record ModelInformation
  String testCaseName="";
  String FMUName="";
  String sourceName="";
  ReferenceType Reference[:]=fill(ReferenceType(),0);
end ModelInformation;

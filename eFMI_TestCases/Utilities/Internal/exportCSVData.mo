within eFMI_TestCases.Utilities.Internal;
function exportCSVData
    input Real data[:,:];
    input String separator;
    input String filename;
    input Boolean do32Bit=false;

    output Boolean ok;

  external "C" ok = exportCSV_C(
    data,
    size(data,1),
    size(data,2),
    separator,
    filename,
    do32Bit)
    annotation (Include="
      int exportCSV_C(double *data, size_t n, size_t m, const char *separator, const char *filename, int do32Bit) {
      
      char *s;
      FILE *f;
      int i,j;
      char value[30];
      int ok;
      
      ok = 1;
      
      f = fopen(filename, \"a\");  
      if (f==NULL) {
          ok = 0;
          ModelicaError(\"Cannot open CSV file.\");
      }
      
      s = ModelicaAllocateString(m*30);
      
      for(i=0; i<n; i++) {
        for(j=0; j<m-1; j++){
          if (do32Bit) 
            sprintf(value, \"%0.9g\", data[i*m + j]);
          else
            sprintf(value, \"%0.17g\", data[i*m + j]);
           strcat(s, value);
           strcat(s, separator);       
         }
         
        if (do32Bit)
          sprintf(value, \"%0.9g\", data[i*m + m-1]);       
        else
          sprintf(value, \"%0.17g\", data[i*m + m-1]);       
        strcat(s, value);    
        strcat(s, \"\\n\");
        
        fprintf(f, s);
        sprintf(s, \"\\0\");
        
      }
      
      if (f!=NULL)
          fclose(f);
            
     
      return ok;
      
      }  
      ");
end exportCSVData;

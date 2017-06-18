%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
FILE *jasm;
%}
 
%token BinaryForm
%union {
  char *binary;
}
 
%type<binary> BinaryForm;
 
%start program 
%%
program : BinaryForm {
    char* binary = malloc(strlen($1)*sizeof(char));
    for(int i = 0; i<strlen($1); i++){
        if($1[i] == 'I')
          binary[i] = '1';
        else binary[i] = '0';
    }
    int decimal = 0;
    int two = 1;
    for(int i =strlen($1) -1; i >=0; i--){
        if(binary[i] == '1') 
            decimal += two;
        two *= 2;
    }
    fprintf(jasm,"\tmethod public static void main(java.lang.String[])\n\tmax_stack 30\n\tmax_locals 30\n\t{\n");
    fprintf(jasm,"\t\tgetstatic java.io.PrintStream java.lang.System.out\n");
    fprintf(jasm,"\t\tldc \"%s\"\n",$1);
    fprintf(jasm,"\t\tinvokevirtual void java.io.PrintStream.println(java.lang.String)\n");
    fprintf(jasm,"\t\tgetstatic java.io.PrintStream java.lang.System.out\n");
    fprintf(jasm,"\t\tldc \"%s\"\n",binary);
    fprintf(jasm,"\t\tinvokevirtual void java.io.PrintStream.println(java.lang.String)\n");
    fprintf(jasm,"\t\tgetstatic java.io.PrintStream java.lang.System.out\n");
    fprintf(jasm,"\t\tldc %d\n",decimal);
    fprintf(jasm,"\t\tinvokevirtual void java.io.PrintStream.println(int)\n");
    fprintf(jasm,"\t\treturn\n");
    fprintf(jasm,"\t}\n");


}
%%
int main(void)
{
  jasm = fopen("final.jasm","w");
  fprintf(jasm,"class finalexam\n");
  fprintf(jasm,"{\n");
  yyparse();
  fprintf(jasm,"}\n");
  fclose(jasm);
  return 0;
}

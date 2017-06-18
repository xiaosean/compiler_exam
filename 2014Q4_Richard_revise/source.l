%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
%}
 
%%

"O"|"I"("O"|"I")* { 
	yylval.binary = strdup(yytext);
	return (BinaryForm);
}


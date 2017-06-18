#!/usr/bin/python
import sys
import os

# lex source.l
# cc -o scanner -O lex.yy.c -ll
# ./scanner <  hello_world.txt
 
if __name__ == '__main__':
	# filename = "test.go"		
	# filename = "example.go"		
	# filename = "HelloWorld.go"		
	# filename = "sigma.go"		
	filename = "test.go"		
	os.system("bison -y -d yacc.y")
	os.system("flex source.l")
	# os.rename("lex.yy.c", "lex.yy.cpp")
	# os.system("mv lex.yy.c lex.yy.cpp")
	os.system("gcc lex.yy.c y.tab.c  -ll -ly")
	

	# if(len(sys.argv) == 2):
	# 	filename = sys.argv[1]
	# # print("test filename => ", filename)
	os.system("./a.out < " + filename) 
	jasm_filename = "final"
	os.system("../javaaPortable/javaa ./%s.jasm" % jasm_filename)
	java_filename = "finalexam"
	os.system("java %s" % java_filename)

	sys.exit()
comp:  sintatico.tab.o  lex.yy.o main.o codeGeneration.o symbolTable.o
	gcc lex.yy.o sintatico.tab.o main.o codeGeneration.o symbolTable.o -o comp
	
lex.yy.o:   lex.yy.c
	gcc -c lex.yy.c
	
sintatico.tab.o:  sintatico.tab.c
	gcc -c sintatico.tab.c

lex.yy.c:  lexico.l
	flex lexico.l
	
sintatico.tab.c:   sintatico.y
	bison -d sintatico.y -o sintatico.tab.c
	
main.o:  main.c
	gcc -c main.c 

codeGeneration.o:  
	gcc -c codeGeneration.c  
	
symbolTable.o: 
	gcc -c symbolTable.c

clean: 
	rm *.o *.tab.c *.tab.h *.yy.c *.asm comp

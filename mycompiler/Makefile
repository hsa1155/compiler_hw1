all:testLexer.class mycompiler.class mycompiler.java mycompiler.tokens


testLexer.class:mycompiler.java
	javac -cp ./antlr-3.5.2-complete-no-st3.jar  testLexer.java mycompiler.java


mycompiler.class:mycompiler.java
	javac -cp ./antlr-3.5.2-complete-no-st3.jar  testLexer.java mycompiler.java

mycompiler.java:
	java -jar antlr-3.5.2-complete-no-st3.jar  mycompiler.g

run1:testLexer.class
	java -cp ./antlr-3.5.2-complete-no-st3.jar:. testLexer input1.c

run2:testLexer.class
	java -cp ./antlr-3.5.2-complete-no-st3.jar:. testLexer input2.c

run3:testLexer.class
	java -cp ./antlr-3.5.2-complete-no-st3.jar:. testLexer input3.c

run4:testLexer.class
	java -cp ./antlr-3.5.2-complete-no-st3.jar:. testLexer input4.c

run5:testLexer.class
	java -cp ./antlr-3.5.2-complete-no-st3.jar:. testLexer input5.c

clean:
	rm -rf mycompiler.class mycompiler.tokens testLexer.class mycompiler.java *.class
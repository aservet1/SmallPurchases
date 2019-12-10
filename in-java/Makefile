classes = Entry.java Record.java


default : classes

classes : $(classes)
	javac *.java

entry : Entry.java #this one just javacs Entry (like it should)
	javac Entry.java

record : Record.java #this one javacs Entry and Record (wtf)
	javac Record.java

clean :
	rm -f *.class

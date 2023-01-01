simple:
	jflex MyLexer.flex
	mkdir -p classes
	javac -d classes TestIt.java
	java -cp classes TestIt

complex:
	jflex MyLexer2.flex
	mkdir -p classes
	javac -d classes TestIt.java
	java -cp classes TestIt

.PHONY: simple complex

clean:
	-rm -rf ./classes ./MyLexer.java ./MyLexer2.java ./MyLexer2.java~ ./MyLexer.java~
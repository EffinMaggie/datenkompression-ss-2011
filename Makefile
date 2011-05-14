SOURCETOOLS=$(wildcard DataCompression/tools/*.java)
SOURCEUTIL=$(wildcard DataCompression/util/*.java)
SOURCETEST=$(wildcard DataCompression/tests/*.java)
SOURCETASKS=$(wildcard DataCompression/tasks/*.java)


JAVAC=javac
#JAVAC=/usr/lib/jvm/java-1.5.0-sun/bin/javac

SOURCE=$(SOURCETOOLS) $(SOURCEUTIL) $(SOURCETEST) $(SOURCETASKS)

OBJECTS=$(SOURCE:.java=.class)

%.class: %.java
	$(JAVAC) -cp . $<

all: $(OBJECTS)

.PHONY : doc
doc: 
	javadoc -private  -d doc/ -classpath ..  -subpackages DataCompression.tools DataCompression.tests DataCompression.util DataCompression

.PHONY : clean
clean:
	@rm -f DataCompression/util/*.class
	@rm -f DataCompression/tools/*.class
	@rm -f DataCompression/tests/*.class
	@rm -f DataCompression/tasks/*.class
	@rm -f $(OBJECTS)
	@rm -rf doc/*


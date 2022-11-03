TARGET = pascal-like
OBJECTS = lex.yy.c parser.tab.c
HEADERS = parser.tab.h

$(TARGET): $(OBJECTS)
	gcc -o $@ $^ -lfl

lex.yy.c: pascal_like.l
	flex $^

parser.tab.c parser.tab.h: parser.y
	bison -d $^

clean:
	rm $(TARGET) $(OBJECTS) $(HEADERS)

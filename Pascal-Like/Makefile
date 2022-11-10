TARGET = pascal-like
MAIN = main.c
OBJECTS = lex.yy.c pascal_like.tab.c
HEADERS = pascal_like.tab.h

$(TARGET): $(MAIN) $(OBJECTS)
	gcc -o $@ $^ -lfl -DYYDEBUG

lex.yy.c: pascal_like.l
	flex $^

pascal_like.tab.c pascal_like.tab.h: pascal_like.y
	bison -d $^

clean:
	rm $(TARGET) $(OBJECTS) $(HEADERS)

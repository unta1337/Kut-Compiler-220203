TARGET = pascal-like
OBJECTS = lex.yy.c

$(TARGET): $(OBJECTS)
	gcc -o $@ $^ -lfl

lex.yy.c: pascal-like.l
	flex $^

clean:
	rm $(OBJECTS) $(TARGET)

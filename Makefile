CC=gcc
CFLAGS=-lGL -lGLEW -lSDL2 -lm
FILES=*.c
PROGRAM=engine

hello:
	$(CC) $(FILES) -o $(PROGRAM) $(CFLAGS)

# Name: Makefile
# Author: Matthew T. Pandina
# Copyright: 2010-2011
# License: <insert your license reference here>

CC=gcc
CFLAGS=-Wall -std=gnu99 -O3 -c
LDFLAGS=-lpng -lm
SOURCES=main.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=png2tlc

all: $(SOURCES) $(EXECUTABLE)

clean:
	rm -rf $(EXECUTABLE) $(OBJECTS)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@

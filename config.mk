LIBS = -lc -lm

CC = cc
GENFLAGS = -Wall -Iinclude/ -g3
CFLAGS = -ansi -std=c99 ${GENFLAGS}
LDFLAGS = ${LIBS}
PREFIX = /usr/local

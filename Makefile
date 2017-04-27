include config.mk

OBJECTS = $(patsubst %.c,%.o, $(wildcard *.c))
ARCHIVE_OUT = libdot3kc.a
%.o: $.c
	@echo CC $<
	@${CC} ${CFLAGS} -c $< -o $@

${ARCHIVE_OUT}: ${OBJECTS}
	@${AR} cr ${ARCHIVE_OUT} ${OBJECTS}

all: ${ARCHIVE_OUT}

clean:
	rm -f ${OBJECTS} ${ARCHIVE_OUT}

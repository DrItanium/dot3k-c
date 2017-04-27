include config.mk

CFLAGS += -Isrc/lib/

OBJECTS = $(patsubst %.c,%.o, $(wildcard src/lib/*.c))

TEST_PROGRAMS = bl-test \
				joy-test \
				lcd-test
				#midi-test

ARCHIVE_OUT = libdot3kc.a

all: ${ARCHIVE_OUT} ${TEST_PROGRAMS}

%.o: %.c
	@echo CC $<
	@${CC} ${CFLAGS} -c $< -o $@

${ARCHIVE_OUT}: ${OBJECTS}
	@${AR} cr ${ARCHIVE_OUT} ${OBJECTS}

bl-test: src/test/bl-test.o ${ARCHIVE_OUT}
	@echo Building bl-test
	@${CC} ${LDFLAGS} -o $@ $< ${ARCHIVE_OUT}

midi-test: src/test/midi-test.o ${ARCHIVE_OUT}
	@echo Building midi-test
	@${CC} ${LDFLAGS} -lportmidi -o $@ $< ${ARCHIVE_OUT}
joy-test: src/test/joy-test.o ${ARCHIVE_OUT}
	@echo Building joy-test
	@${CC} ${LDFLAGS} -o $@ $< ${ARCHIVE_OUT}
lcd-test: src/test/lcd-test.o ${ARCHIVE_OUT}
	@echo Building lcd-test
	@${CC} ${LDFLAGS} -o $@ $< ${ARCHIVE_OUT}


clean:
	rm -f ${OBJECTS} ${ARCHIVE_OUT} ${TEST_PROGRAMS}



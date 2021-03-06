#
#
PREFIX?=/usr/local
CFLAGS+=	-pipe -O2 -Wall -g
OBJS=	subcalc.c
LIBS=	-lm
CC?=	cc
TARGETS=	subcalc subcalc.1.gz

all: $(TARGETS)

subcalc.1.gz:
	gzip -9 -c subcalc.1 > subcalc.1.gz

subcalc:	$(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) $(CFLAGS)

install:
	cp subcalc $(PREFIX)/bin
	cp subcalc.1.gz $(PREFIX)/man/man1/

deinstall:
	rm -f $(PREFIX)/man/man1/subcalc.1.gz
	rm -f $(PREFIX)/bin/subcalc

clean:
	rm -f subcalc subcalc.1.gz

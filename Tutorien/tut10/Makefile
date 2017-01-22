LIBS:=ompi-c

CPPFLAGS+=$$(pkg-config --cflags-only-I $(LIBS))
CFLAGS+=$$(pkg-config --cflags-only-other $(LIBS))
LDFLAGS+=$$(pkg-config --libs-only-L --libs-only-other $(LIBS))
LDLIBS+=$$(pkg-config --libs-only-l $(LIBS))

CFLAGS+=-g

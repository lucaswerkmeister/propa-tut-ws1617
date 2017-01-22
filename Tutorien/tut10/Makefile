LIBS:=ompi-c

CPPFLAGS+=$$(pkg-config --cflags-only-I $(LIBS))
CFLAGS+=$$(pkg-config --cflags-only-other $(LIBS))
LDFLAGS+=$$(pkg-config --libs-only-L --libs-only-other $(LIBS))
LDLIBS+=$$(pkg-config --libs-only-l $(LIBS))

CFLAGS+=-g

ifeq ($(SOL),1)
TASK3_2 := task3-2-sol.o
else
TASK3_2 := task3-2-impl.o
endif

task3-2: task3-2.o $(TASK3_2)

test-task3-2: task3-2
	mpirun -np 4 $<

.PHONY: test-task3-2

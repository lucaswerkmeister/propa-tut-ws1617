.PHONY: test clean

test: BarrierTest.class
	java -cp .. barrier.BarrierTest
BarrierTest.class Barrier.class IBarrier.class: BarrierTest.java Barrier.java IBarrier.java
	javac $^
clean:
	$(RM) BarrierTest.class Barrier.class IBarrier.class

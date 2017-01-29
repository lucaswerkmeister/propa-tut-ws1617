package barrier;

public class Barrier implements IBarrier {

    private final int maxThreads;

    public Barrier(int maxThreads) {
        this.maxThreads = maxThreads;
    }

    @Override
    public void await() throws InterruptedException {
        // TODO
    }

    @Override
    public void freeAll() {
        // TODO
    }
}

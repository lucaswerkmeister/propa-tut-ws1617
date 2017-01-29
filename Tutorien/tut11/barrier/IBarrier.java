package barrier;

public interface IBarrier {
    public void await() throws InterruptedException;
    public void freeAll();
}

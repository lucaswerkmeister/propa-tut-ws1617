package barrier;

import java.util.Random;

public class BarrierTest {
    public static final int THREADS = 4;
    public static void main(String[] args) {
        final Barrier barrier = new Barrier(THREADS);
        for (int i = 0; i < THREADS; i++) {
            new Thread() {
                @Override
                public void run() {
                    try {
                        // randomly sleep up to five seconds
                        Thread.sleep(new Random().nextInt(50) * 100);
                        System.out.println("before entering barrier");
                        barrier.await();
                        System.out.println("after entering barrier");
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }.start();
        }
    }
}

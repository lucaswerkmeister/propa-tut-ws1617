package primes;

import static primes.DivisionSeq.isPrime;
import static primes.DivisionSeq.target;

public class DivisionPar {

    public static void count(int threads) {
        // TODO parallelize
        int count = 0;
        final long startTime = System.currentTimeMillis();
        for (int i = 2; i <= target; i++) {
            if (isPrime(i)) {
                count++;
            }
        }
        final long endTime = System.currentTimeMillis();

        System.out.println(threads + "-thread duration for interval [2, " + target + "]"
                           + " is " + (endTime - startTime) + "\u202Fms\n"
                           + count + " primes");
    }

    public static void main(String[] args) {
        count(1);
        count(2);
        count(4);
        count(8);
    }
}

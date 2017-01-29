package primes;

public class DivisionSeq {

  public static final int target = 10_000_000;

  public static boolean isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i <= Math.sqrt(n); i++)
      if (n % i == 0) return false;
    return true;
  }

  public static void main(String[] args) {
    int count = 0;
    final long startTime = System.currentTimeMillis();
    for (int i = 2; i <= target; i++)
      if (isPrime(i)) count++;
    final long endTime = System.currentTimeMillis();

    System.out.println(
      "Duration for interval [2, " + target + "]"
      + " is " + (endTime - startTime) + "\u202Fms\n"
      + count + " primes");
  } }
/* Local Variables: */
/* mode: java */
/* c-basic-offset: 2 */
/* End: */

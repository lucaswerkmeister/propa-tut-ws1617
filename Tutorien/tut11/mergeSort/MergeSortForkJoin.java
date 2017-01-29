package mergeSort;

import java.util.Random;

public class MergeSortForkJoin {
    public static final int elements = 10_000_000;

    public static void main(String[] args) {
        // generate an array of random integers
        int[] numbers = new int[elements];
        Random random = new Random();
        for (int i = 0; i < elements; i++)
            numbers[i] = random.nextInt();

        long duration = sort(numbers);
        System.out.println("Sorting " + elements + " elements took " + (duration/1_000_000.0) + "\u202Fms");
        for (int i = 0; i < elements - 1; i++)
            if (numbers[i] > numbers[i+1])
                throw new IllegalStateException("numbers["+i+"] /* " + numbers[i] + " */ > numbers["+(i+1)+"] /* " + numbers[i+1] + " */");
    }

    /*
     * Sort the given array.
     * 
     * @return the time that the sorting took, in nanoseconds.
     */
    public static long sort(int[] array) {
        long start = System.nanoTime();
        // TODO
        return System.nanoTime() - start;
    }
}

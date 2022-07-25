package lecture24;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class PerformanceTest {
    public static void main(String[] args) {
        long start = System.currentTimeMillis();
//        ArrayList<String> list = new ArrayList<>();
        LinkedList<String> list = new LinkedList<>();
//        testListInsert(list);
//        testListRandomRetrieval(list);
        testListAddAtFirst(list);

        // taskToMeasure();
        //sum();
        long end = System.currentTimeMillis();
        System.out.println("ArrayList took: " + (end-start) + " ms");
        // if the execution time is very small, try to run it multiple times and
        // take the avg. time

        // before optimization, might look at the first version of the
        // application and compared to current version.

        // profiler is a good way to measure the performance if don't have a
        // clear idea why the application is slow

        // absolute execution time, profiler is not very accurate because of
        // the overhead
    }

    private static long sum() {
        // It take a little longer because of autoboxing and addition between
        // primitive and object.
        // Try running with wrapper class or without it
        long sum = 0L;
        for (long i = 0; i <= Integer.MAX_VALUE; i++) {
            sum += i;
        }

        return sum;
    }

    // ArrayList is more like an array

    // Recall: LinkedList has pointers to point to each object sequentially / in
    // order. It needs to traverse the list to retrieve the items
    // Insertion sequential insertion is also a little bit longer because of the
    // pointer setup and other additional work?

    private static void testListInsert(List<String> list) {
        for (int i = 0; i < 1000000; i++) {
            String str = "";
            list.add(str);
        }
    }

    private static void testListRandomRetrieval(List<String> list) {
        int random;
        for (int i = 0; i < 100000; i++) {
            random = (int) (Math.random() * 100000);
            list.get(random);
        }
    }

    private static void testListAddAtFirst(List<String> list) {
        for (int i = 0; i < 100000; i++)
            list.add(0, "");
    }
}

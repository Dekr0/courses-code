package lecture15;

import java.util.*;

public class APITest {

    public static void main(String[] args) {
        testQueue();
    }

    public static void testSet() {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(2);

        // HashMap is a Wrapper class for HashSet to provide non-duplicate property.
        // HashMap stores key and value pairs. The key will be the hash code for the
        // value, and is used for indexing a key and value pair as well as check for
        // duplicate.

        // If you want to use a class with Set, you should override hashCode() to
        // achieve true equality.
        Collection<Integer> noDups = new HashSet<>(list);

        Set<Integer> s1 = new HashSet<>();
        Set<Integer> s2 = new HashSet<>();
        for (int i = 1; i < 3; i++)
            s1.add(i);
        for (int i = 4; i < 8; i++) {
            s2.add(i);
        }

        Set<Integer> union = s1;
        union.addAll(s2);
        Set<Integer> intersection = s1;
        intersection.retainAll(s2);
        Set<Integer> difference = s1;
        difference.removeAll(s2);
    }

    public static void testList() {
        LinkedList<Float> list = new LinkedList<>();
        list.add(1.0f);
        list.add(2.3f);
        list.add(3.4f);

        ListIterator<Float> it;
        for (it = list.listIterator(); it.hasNext(); )
            System.out.println(it.next());

        // Traverse backward, seek to the end of the list
        // Also can use descending iterator
        for (it = list.listIterator(list.size()); it.hasPrevious(); )
            System.out.println(it.previous());

    }

    /**
     * Queue and Deque are interfaces (not classes). You cannot instantiate
     * instance from this interface.
     */
    public static void testQueue() {
        Queue<Consumer> queue = new LinkedList<>();
        Deque<Consumer> deck = new LinkedList<>(); // new LinkedList<>() creates a empty list

        deck.push(new Consumer());
        deck.push(new Consumer());
        deck.push(new Consumer());

        while(!deck.isEmpty())
            System.out.println(deck.pop().name);

    }

    /**
     * Only work if c is type Collection<Object>. Type like Collection<Integer>,
     * Collection<String> and so on, are not subtypes of Collection<object>.
     * Check lecture 14 slide about how inheritance work in generic
     * @param list
     */
    public static void filterBounded(Collection<Object> c) {
        for (Object elem :
                c) {
            System.out.println(elem + " ");
        }
        System.out.println();
    }

    public static <T> void filter(Collection<T> c) {
        Iterator<T> it;
        for (it = c.iterator(); it.hasNext(); ) {
            if (!someCondition(it.next()))
                it.remove();
        }
    }

    /**
     * Work same as the "filter" but using unbounded wildcard type.
     * The unbounded wildcard type is specified using the wildcard character (?),
     * for example, List<?>. This is called a list of unknown type.
     *
     * There are two scenarios where an unbounded wildcard is useful:
     *     writing a method that can implemented using functionality provided in
     *     the Object class
     *     when the code is using methods in the generic class that don't depend
     *     on the type parameter. For example, List.size or List.clear. In fact,
     *     Class<?> is so often used because most of the methods in Class<T> do
     *     not depend on T
     */
    public static void filterWildCard(Collection<?> c) {
        Iterator<?> it;
        for (it = c.iterator(); it.hasNext(); ) {
            if(!someCondition(it.next()))
                it.remove();
        }
    }

    public static <T> boolean rotate(List<T> l) {
        return l.add(l.remove(0));
    }

    /* Fails because the compiler cannot deduce the result of remove() return
    the same type that add excepts

    public static boolean rotateWildCard(List<?> l) {
        return l.add(l.remove(0));
    }
    */

    public static <T> boolean someCondition(T t) {
        return false;
    }
}

class Consumer {
    static int count = 0;
    String name;

    Consumer() {
        name = "Consumer " + count++;
    }
}

package lecture14;

import java.util.Collection;
import java.util.Iterator;

public class Filter {
    // Mistake: Collection c is using raw type
    static void filter(Collection<?> c) {
        Iterator<?> it;
        for (it = c.iterator(); it.hasNext(); ) {
            if (it.next() == null)
                it.remove();
        }
    }
}

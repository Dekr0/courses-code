package lecture19;

import java.util.EnumSet;
import java.util.Set;

public class Hoodie {
    private Set<Size> sizes;

    Hoodie(Set<Size> sizes) {
        this.sizes = sizes;
    }

    public static void main(String[] args) {
        Hoodie hoodie = new Hoodie(EnumSet.of(Size.S, Size.M, Size.L));
    }
}

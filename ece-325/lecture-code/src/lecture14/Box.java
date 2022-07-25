package lecture14;

import java.util.Random;

public class Box <T>{
    private T contents;

    public void setContents(T contents) {
        this.contents = contents;
    }

    public T getContents() {
        return contents;
    }

    public static void main(String[] args) {
        Box b1 = new Box();
        Box<String> b2 = new Box<String>();

        // box1 -> Box<String> obj, to the compiler, box1 is still raw type
        // Assigning new reference value does not change the object type of
        // the variable.

        // Dangerous, typechecking on b2 but not b1. We can add
        // raw type that does not match the type specified by b2.
        // This affect b2 indirectly via assigning to v1;
        b2 = b1;
        b2.setContents(new String("Hello"));
        b1.setContents(new Random());
    }
}

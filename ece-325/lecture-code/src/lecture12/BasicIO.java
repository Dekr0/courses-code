package lecture12;

import java.io.IOException;
import java.io.InputStream;

public class BasicIO {
    public static void main(String[] args) throws IOException {
        InputStream in = System.in;
        // System.in is always available once JVM starts
        // Close BufferReader

        // byte stream is very low level, not easy to work with
        // for instance, some characters from unicode take more
        // than a byte.

        // Make sure to use character stream

        byte[] b = new byte[50];

        int input = in.read(b);

        System.out.println("Just read: " + (char)input);
    }
}

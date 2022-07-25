package lecture12;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class CharStream {
    public static void main(String[] args) throws IOException {
        FileReader in = null;
        FileWriter out = null;

        try {
            in = new FileReader("input.txt");
            out = new FileWriter("output.txt");
            int c;

            // Not very efficient, reading one char each time
            while ((c = in.read()) != -1) {
                out.write(c);
            }
        } finally {
            if (in != null) { in.close(); }
            if (out != null) { out.close(); }
        }
    }
}

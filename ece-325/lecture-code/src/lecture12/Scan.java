package lecture12;

import java.io.*;
import java.util.Scanner;

public class Scan {
    public static void main(String[] args) throws IOException {
        Scanner s = null;
        BufferedWriter out = null;

        // 

        try {
            s = new Scanner(new BufferedReader(new FileReader("input.txt")));
            out = new BufferedWriter(new FileWriter("output.txt"));
            while(s.hasNext())
                out.write("Token: " + s.next() + System.lineSeparator());
        }
        finally {
            if(s != null)
                s.close();
            if(out != null)
                out.close();
        }    }
}

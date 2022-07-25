package lecture11;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class ExceptionExample {
    ArrayList<String> myList;

    public void addItem(String item) {
        try {
            myList.add(item);
        } catch (NullPointerException e) {
            myList = new ArrayList<String>();
            myList.add(item);
        }
    }

    public void handleLocally() {
        try {
            FileReader f = new FileReader("nouns.txt");
            BufferedReader r = new BufferedReader(f);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void forwardException() throws IOException {
        FileReader f = new FileReader("nouns.txt");
        BufferedReader r = new BufferedReader(f);
    }

    public void handleException() {
        try {
            forwardException();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

    }
}

package lecture20;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class template {
    public static void match(String regex, String toMatch) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(toMatch);
        while (matcher.find()) {
            System.out.println("Found text '" + matcher.group() + "' @ " +
                    matcher.start() + " to " + matcher.end());
        }
    }

    public static void main(String[] args) {
        String r1 = "tricky";
        String r2 = "tricky\\.";
        String r3 = "[Tt]ricky";
        String toMatch = "Tricky regexes are pretty tricky.";

        match(r3, toMatch);
    }
}

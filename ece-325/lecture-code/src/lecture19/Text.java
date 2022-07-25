package lecture19;

import java.util.EnumSet;
import java.util.Set;

public class Text {
    public enum Style{ BOLD, ITALIC, UNDERLINE, STRIKETHROUGH }

    public void applyStyles(Set<Style> styles) {

    }

    public static void main(String[] args) {
        Text text = new Text();
        text.applyStyles(EnumSet.of(Style.BOLD, Style.ITALIC));
    }

    // Another approach is to use n bits to represent n types of style
    // If i bit is 0, then style i is enable, vice versa.
    // To check what style are enable / not enable, bit wise operation
    // Extremely optimized but also easy to produce error when implement
}

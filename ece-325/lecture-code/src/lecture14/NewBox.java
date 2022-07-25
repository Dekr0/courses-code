package lecture14;

public class NewBox <N extends Number> {
    // Number or greater
    // go upward from inheritance


    public static void main(String[] args) {
        Box<Number> boxNumber = new Box<>();
        Box<Object> boxObject = new Box<>();  // Number extends Object
        Box<Integer> boxInteger = new Box<>();
        boxNumber.setContents(3);
        boxNumber.setContents(3.0d);
        boxObject.setContents(2);
        boxInteger.setContents(3);
    }

}

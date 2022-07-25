package Lecture5;

public class Array {

    public static void main(String[] args) {
        int[] speeds = new int[3];  // Array is object (reference)
        speeds[0] = 100;
        speeds[1] = 200;
        speeds[2] = 300;

        int[] speedsDouble = multiplyIntoNew(speeds,2);

//        int[] speedsCopy = speeds.clone();  // Shallow copy, copy the reference value of the elements in the array
//
        for (int speed :
                speeds)
            System.out.println(speed);
//
//        for (int i = 0; i < speeds.length; i++)
//            System.out.println(speeds[i]);
//
//        int[] speedsLarge = new int[300];
//
//        speeds = speedsLarge;
//
//        Car[] cars = new Car[3];
//        Car[] carsLarge = new Car[300];
//        cars = carsLarge;

        // speeds = cars;

    }

   public static void multiply(int[] arr, int multiplier) {
        // pass by value (reference) for array
       for (int i = 0; i < arr.length; i++) {
           arr[i] = arr[i] * multiplier;
       }
   }

   public static int[] multiplyIntoNew(int[] arr, int i) {
        int[] result = arr.clone();
        multiply(result, i);
        return result;
   }
}

//class Car {
//    int speed;
//
//    Car(int speed) {
//        this.speed = speed;
//    }
//}

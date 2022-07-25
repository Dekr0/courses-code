package lecture26;

import java.util.*;
import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.stream.Collectors;

public class LambdaTest {

    public static void main(String[] args) {
        List<String> cars = Arrays.asList("Ferrari", "Porsche", "Audi", "Mercedes");
        List<String> upperCaseCars = new ArrayList<>();

        cars.forEach(name -> upperCaseCars.add(name.toUpperCase(Locale.ROOT)));

        System.out.println(upperCaseCars);

        cars.stream()
                .map(name -> name.toUpperCase(Locale.ROOT))
                .forEach(name -> System.out.println(name));

        // Revisit Anonymous class (L21): declare and instantiate a class at the same time

        // Concise version
        cars.stream()
                // applies lambda expression to every element of cars, collect
                // and returns the result collection as a Stream
                .map(String::toUpperCase)
                // feed in the Stream from map()
                .forEach(System.out::println);

        cars.stream()
                // applies predicate to every element of cars
                .filter(name -> name.startsWith("F"))
                .forEach(System.out::println);

        List<String> F = cars.stream()
                .filter(name -> name.startsWith("F"))
                .collect(Collectors.toList());

        // Alternative way to pass predicate for filter
        cars.stream()
                .filter(checkIfStartsWith("F"))
                .forEach(System.out::println);
    }

    public static Predicate<String> checkIfStartsWith(String letter) {
        return new Predicate<String>() {
            @Override
            public boolean test(String s) {
                return s.startsWith(letter);
            }
        };

        // simplified
        // return name -> name.startsWith(letter);
    }
}

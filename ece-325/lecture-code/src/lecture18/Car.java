package lecture18;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidParameterException;

public class Car {
    private int maxSpeed;

    /**
     * Drive for h hours at a speed of kmh and
     * return the number of kilometers driven.
     *
     */

    public Integer drive(Integer h, Integer kmh) {
        if (h == null || kmh == null)  // Check null first because autoboxing
            throw new IllegalArgumentException("h or kmh is null");

        if (h < 0 || kmh < 0)
            throw new IllegalArgumentException("h or kmh is negative");

        return h * kmh;
    }

    public int getMaxSpeed() {
        return maxSpeed;
    }

    public static void main(String[] args) {
        // Test-driven development (TDD)
        // Write tests for the requirement first (before program is developed)
        // Then start implementing
        // Use the test outcomes as guidelines for the implementation and refactoring
        // Once all the test cases are passed, the implementation satisfy the requirement

        // refactoring -> change the structure and signature of the code for better
        // readability (no new debugs are introduced / no old bugs are fixed)

        // Java, main unit testing framework -> JUnit

        // What should you test?
        // Common usage cases (regression testing). Make sure the code always work

    }


}

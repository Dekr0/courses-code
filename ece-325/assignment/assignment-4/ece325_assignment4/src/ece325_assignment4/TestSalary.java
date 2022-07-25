package ece325_assignment4;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class TestSalary {

    @Test
    void testCorrectness() {
        double delta = 0.001d;

        assertEquals(0d, Salary.pay(0d, 0d, 0), delta);
        assertEquals(0d, Salary.pay(0d, 0d, 10), delta);
        for (double base = 100.00d; base < 1000.00d; base += 100.00d)
            assertEquals(base, Salary.pay(base, 0d, 0), delta);
        assertEquals(646.32d, Salary.pay(737.49d, 120.67d, 4), delta);
        assertEquals(0, Salary.pay(1000.00d, 1100.00d, 10), delta);
    }

    @Test
    void testSnacks() {
        assertThrows(IllegalArgumentException.class, ()
                -> Salary.pay(1000d, 1200.97d, 7));
        // A member spend more on snacks than they actually earns

        assertThrows(IllegalArgumentException.class, ()
                -> Salary.pay(1000d, -5.49d, 7));
        // snacksAmount is out of range

        assertThrows(IllegalArgumentException.class, ()
                -> Salary.pay(1000d, null, 7));
        // snacksAmount is null
    }

    @Test
    void testBonus() {
        assertThrows(IllegalArgumentException.class, ()
                -> Salary.pay(500d, 400.00d, 11));
        // Bonus is out of range

        assertThrows(IllegalArgumentException.class, ()
                -> Salary.pay(500d, 400.00d, -1));
        // Bonus is out of range

        assertThrows(IllegalArgumentException.class, ()
                -> Salary.pay(500d, 400.00d, null));
        // Bonus parameter is null
    }

    @Test
    void testSalary() {
        assertThrows(IllegalArgumentException.class, ()
                -> Salary.pay(1000.001d, 400.00d, 11));
        // Salary is out of range

        assertThrows(IllegalArgumentException.class, () ->
                Salary.pay(-0.000001d, 400.00d, 11));
        // Salary is out of range

        assertThrows(IllegalArgumentException.class, () ->
                Salary.pay(null, 400.00d, 11));
        // Salary parameter is null
    }
}
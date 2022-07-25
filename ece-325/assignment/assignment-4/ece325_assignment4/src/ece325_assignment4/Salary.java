package ece325_assignment4;

public class Salary {
	
	/**
	 * Returns the amount of pay a band member will get (in dollars). This amount is computed by adding the bonus (if any)
	 * to the base salary and then deducting the amount spent on snacks. So, if a band member earned 100 dollars, spent 50 on snacks,
	 * and earned a bonus of 10 (%), their pay will be 60 dollars. 
	 * 
	 * Note: The current implementation of this method is extremely buggy and can easily be abused by anyone.
	 * 
	 * @param salary The base salary earned by this band member during this salary period (in dollars).
	 * @param snacksAmount The total amount spent by this band member on snacks during this salary period (in dollars).
	 * @param bonus The bonus percentage that the band member earned this salary period (in percentage).   
	 * @return the amount of pay a band member will get (in dollars)
	 */
	public static Double pay(Double salary, Double snacksAmount, Integer bonus) {
		if (salary == null || snacksAmount == null || bonus == null)
			throw new IllegalArgumentException("Parameters cannot be null");

		if (salary < 0d || salary > 1000d)
			throw new IllegalArgumentException(
					"Base salary must be positive and less than or equal to $1,000."
			);

		if (snacksAmount < 0)
			throw new IllegalArgumentException(
					"Snacks amount must be positive."
			);

		if (bonus < 0 || bonus > 10)
			throw new IllegalArgumentException(
					"Bonus must be between 0 and 10 as a integer."
			);

		Double totalSalary = salary * (1 + bonus * 0.01d);


		if (totalSalary < snacksAmount)
			throw new IllegalArgumentException(
					"A band member cannot spend more on snacks than they earn.");

		totalSalary -= snacksAmount;

		return totalSalary;
	}
}

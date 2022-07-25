package ece325_lab_assignment4;

import java.time.LocalDate;

/**
 * Finish the implementation of this class. No need to add any instance variables or methods.
 *
 */
public class ZooAnimal {
	/**
	 * The last date on which this animal was fed.
	 */
	private LocalDate lastFeed;
	
	/**
	 * The name of the animal.
	 */
	private String name;
	
	public ZooAnimal(String name) {
		this.name = name;
	}
	
	public LocalDate getLastFeed() {
		return lastFeed;
	}
	
	
	/**
	 * Returns true iff the animal was fed already today.
	 * @return true if the animal was fed today
	 */
	public boolean isFedAlready() {
		return LocalDate.now().equals(getLastFeed());
	}
	
	public void feed() {
		// finish this implementation
		lastFeed = LocalDate.now();
		System.out.println(getName() + "is fed");
	}
	
	public String getName() {
		return name;
	}
}

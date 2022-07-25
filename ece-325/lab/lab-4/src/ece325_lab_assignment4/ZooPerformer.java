package ece325_lab_assignment4;

/**
 * When an artist performs in a zoo, there is the additional requirement of having to help with
 * feeding the animals. You may change the signature of the feed() method to reflect that it
 * throws one or more exceptions, if necessary.
 * 
 *
 */
public interface ZooPerformer {
	public void feed(ZooAnimal a) throws AlreadyFedException, NotPlayingException;
}

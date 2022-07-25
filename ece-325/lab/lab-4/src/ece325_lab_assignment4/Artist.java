package ece325_lab_assignment4;

/**
 * The artist/band that is performing. You must finish this class.
 * @author corpaul
 *
 */
public class Artist implements ZooPerformer {
	/** 
	 * Indicates whether the artist is currently playing (= performing). 
	 */
	private boolean isPlaying;
	
	public Artist() {
		isPlaying = false;
	}
	
	/** 
	 * Feed the animal. Make sure to check whether we are allowed to feed this animal,
	 * and make sure to handle things correctly if we are not allowed to feed it. You are allowed
	 * to change this method's signature, if necessary.
	 * 
	 */
	public void feed(ZooAnimal animal) throws AlreadyFedException, NotPlayingException {
		//		
		// did we already feed this animal today?
		if (!isPlaying)
			throw new NotPlayingException("Animals need to be fed when the show is playing!");

		if (animal.isFedAlready())
			throw new AlreadyFedException(animal.getName() + " was already fed today!");

		// finish this implementation
		System.out.println("Artist tries to feed " + animal.getName());
		animal.feed();
	}

	/**
	 * Sometimes, artists get distracted, so there is a 50% chance that they start
	 * playing when you call this method. 
	 * 
	 */
	public void startPlaying() {
		// if we are already playing, don't risk getting distracted again
		if (!isPlaying) {
			// If the chance is lower 50% inclusively, it returns false.
			// Equivalently, it implies that the artist gets distracted
			// and does not start the show.
			isPlaying = Math.random() > 0.50;
			System.out.println("Artist tries to start playing the show");
		}
	}
	
	public void stopPlaying() {		
		// finish this implementation
		if (isPlaying) {
			isPlaying = false;
			System.out.println("Artist stops playing the show");
			return;
		}

		System.out.println("The show is either not started yet, or the artist " +
				"was already stopped playing the show");
	}
}

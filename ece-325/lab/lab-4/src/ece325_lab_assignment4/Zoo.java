package ece325_lab_assignment4;

import java.util.ArrayList;

/**
 * You do not have to make changes to this class.
 *
 */
public class Zoo {
	private ArrayList<ZooAnimal> animals;
	
	/** 
	 * Creates a new zoo and adds the animals who currently live in the zoo to it.
	 */
	public Zoo() {
		animals = new ArrayList<ZooAnimal>();
		addAnimals();	
	}	
	
	/**
	 * Add all the animals who currently live in the zoo. After you create a Zoo object,
	 * there is no need to call this method again.
	 */
	private void addAnimals() {
		animals.add(new ZooAnimal("Wunderpus photogenicus"));
		animals.add(new ZooAnimal("Spiny Lumpsucker"));
		animals.add(new ZooAnimal("Pleasing Fungus Beetle"));
		animals.add(new ZooAnimal("Pink Fairy Armadillo"));
		animals.add(new ZooAnimal("Rasberry Crazy Ant"));
		animals.add(new ZooAnimal("Satanic Leaf-Tailed Gecko"));
		animals.add(new ZooAnimal("Tasselled Wobbegong"));
		animals.add(new ZooAnimal("Hellbender"));
		animals.add(new ZooAnimal("Chicken Turtle"));
		animals.add(new ZooAnimal("Star-Nosed Mole"));	
	}
	
	/**
	 * Animals have a tendency to pop up randomly. This method will return you
	 * a randomly selected animal from the zoo which will come up to the stage to get fed.
	 * @return A randomly selected animal
	 */
	public ZooAnimal getRandomAnimalToComeToStage() {
		int index = (int) (Math.random()*animals.size());
		return animals.get(index);
	}
	
	/**
	 * Returns true iff all animals are fed.
	 * @return true iff all animals are fed.
	 */
	public boolean allAnimalsFed() {
		for(ZooAnimal a : animals) {
			if(!a.isFedAlready())
				return false;
		}
		return true;
	}
}

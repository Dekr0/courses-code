package ece325_lab_assignment4;

public class ZooShow {
	
	public static void main(String[] args) {
		// create the artist
		Artist artist = new Artist();

		// create the zoo
		Zoo zoo = new Zoo();

		// while there are animals that still need feeding,
		// randomly select an animal from the zoo
		// feed it
		while (!zoo.allAnimalsFed()) {
			ZooAnimal animal = zoo.getRandomAnimalToComeToStage();
			artist.startPlaying();
			try {
				artist.feed(animal);
			}  catch (NotPlayingException e) {
				System.err.println(e.getMessage());
				artist.startPlaying();
			} catch (AlreadyFedException e) {
				System.err.println(e.getMessage());
			}
		}

		// stop playing when all animals are fed
		System.out.println("All animals were fed");
		artist.stopPlaying();
	}
}

package ece325_assignment2;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class CollectionManager {

	private SongCollection collection;

	private boolean songsLoaded = false;

	private String songsFile;

	public CollectionManager(String songsFile) {
		this.songsFile = songsFile;
		collection = new SongCollection();
	}

	/**
	 * Load all the songs title into collection from file
	 */
	public void loadSongs() {
	    if (songsLoaded) return;

		ArrayList<String> songTitles = loadTxt(songsFile);

		for (String songTitle : songTitles)
			collection.addSongToCollection(new Song(songTitle));
	}

	/**
	 * A static method or function for loading text file with a specific format
	 * that the first line specifies the number of lines needed to load.
	 * @param fileName  name of the file needed to load
	 * @return lines  a list of lines stored in the file
	 */
	private static ArrayList<String> loadTxt(String fileName){
		ArrayList<String> lines = new ArrayList<String>();
		BufferedReader reader = null;

		try {
			reader = new BufferedReader(new FileReader(fileName));

			int totalLines = Integer.parseInt(reader.readLine());

			String line;
			while ((line = reader.readLine()) != null)
				lines.add(line);

			// Ensure the number of lines read equals to the number of lines
			// specifies in the file.
			assert lines.size() == totalLines :
					"Number of loaded lines does not equal the number of lines listed in the file";

		} catch (FileNotFoundException f) {
			System.err.printf("%s does not exist", fileName);
		} catch (Exception e) {
			System.err.printf("Exception occurs when reading %s", fileName);
			e.printStackTrace();
		} finally {
			try {
				if (reader != null) reader.close();
			} catch (IOException i) {
				System.err.printf("Failed to close %s", fileName);
				i.printStackTrace();
			}
		}

		return lines;
	}

	/**
	 * A static method that generate and return a largest and non-repeated album
	 * from a song file.
	 *
	 * @param songsFile  name of the file needed to load
	 * @return album  a largest and non-repeated album
	 */
	public static Album createLargestAlbum(String songsFile) {
		Album album = new Album();

		ArrayList<String> songTitles = loadTxt(songsFile);

		for (String songTitle : songTitles)
			album.addSongToCollection(new Song(songTitle));

		return album;
	}

	public static void main(String[] args) {
		// The file name is passed by command line argument / parameter
		CollectionManager manager = new CollectionManager(args[0]);

		manager.loadSongs();

		Album largestAlbum = createLargestAlbum(args[0]);
		System.out.println(largestAlbum);
	}

}

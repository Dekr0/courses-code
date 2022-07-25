package ece325_lab_assignment5;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * This class represents a Song. A Song has a title, release date, and a popularity score.
 * You are not allowed to change the code that is in between the indications, but you are allowed to add
 * code before and after the indicated lines.
 * 
 * @author Cor-Paul Bezemer
 *
 */
public class SongCollection {
	// not allowed to change anything after this until the indicated line
	private TreeSet<Song> collection;
	
	public SongCollection() {
		collection = new TreeSet<Song>();
	}
	
	public static LocalDate parseLocalDate(String str) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		return LocalDate.parse(str, formatter);
	}
	
	public void addSong(Song s) {
		collection.add(s);
	}	
	
	public String toString() {
		String str = "[SongCollection: " + collection.size() + " songs: \n";
		for(Song s : collection) {
			str += "\t" + s + "\n";
		}
		return str + "]";
	}
	
	// you are allowed to make changes/add code after this
	public void loadSongs(String filename) {
		BufferedReader reader = null;
		Scanner scanner = null;

		try {
			reader = new BufferedReader(new FileReader(filename));
			scanner = new Scanner(reader);

			// Take one line each time
			scanner.useDelimiter("\n");

			// Match multiple digits, letters or white spaces followed by a comma
			String title_pattern = "(?<title>[\\w\\s]+),";

			// Match multiple digits only followed by a comma
			String popularity_pattern = "(?<popularity>\\d+),";

			// Match date only
			String date_pattern = "(?<releaseDate>\\d{4}-\\d{2}-\\d{2})";

			Pattern pattern = Pattern.compile(title_pattern + popularity_pattern + date_pattern);
			Matcher matcher;

			while(scanner.hasNext()) {

				try {
					matcher = pattern.matcher(scanner.next());

					if (!matcher.find())
						throw new IllegalStateException();

					String title = matcher.group("title");

					assert title.strip().isEmpty();

					LocalDate releaseDate = parseLocalDate(matcher.group("releaseDate"));
					int popularity = Integer.parseInt(matcher.group("popularity"));

					Song song = new Song(title, releaseDate, popularity);
					addSong(song);
				} catch (AssertionError | IllegalStateException e) {
					System.err.println("Invalid line when loading songs");
				}
			}

		} catch (FileNotFoundException e) {
			System.err.println(e.getMessage());
		} finally {
			if (scanner != null) scanner.close();
		}
	}

	public List<Song> sort(Comparator<Song> comp) {
		List<Song> sortedSongList = new ArrayList<>(collection);
		sortedSongList.sort(comp);

		return sortedSongList;
	}
	
	public static void main(String[] args) {
		// load and print the songs here
		SongCollection collection = new SongCollection();
		collection.loadSongs("songs.txt");
		System.out.println(collection);

		SongComparator popularityComparator = new SongComparator();
		List<Song> sortByPopularity = collection.sort(popularityComparator);

		for (Song song : sortByPopularity)
			System.out.println(song);
	}
}

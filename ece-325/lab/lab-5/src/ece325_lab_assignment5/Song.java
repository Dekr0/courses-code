package ece325_lab_assignment5;

import java.time.LocalDate;
import java.util.Objects;

/**
 * This class represents a Song. A Song has a title, release date, and a popularity score.
 * You are not allowed to change the code that is in between the indications, but you are allowed to add
 * code before and after the indicated lines.
 * 
 * @author Cor-Paul Bezemer
 *
 */
public class Song implements Comparable<Song>{ // you are allowed to change this line, if necessary
	// not allowed to change anything after this until the indicated line
	private String title;
	private LocalDate releaseDate;
	private int popularity;

	public Song(String title, LocalDate releaseDate, int popularity) {
		this.title = title;
		this.releaseDate = releaseDate;
		this.popularity = popularity;
	}

	public String getTitle() {
		return this.title;
	}

	public LocalDate getReleaseDate() {
		return this.releaseDate;
	}

	public int getPopularity() {
		return this.popularity;
	}
	
	public void setTitle(String s) {
		title = s;
	}
	
	public void setPopularity(int p) {
		if(popularity > 0)
			popularity = p;
	}
	
	public String toString() {
		return "[Song: " + title + ", released on " + releaseDate + ", popularity: " + popularity + "]";
	}

	// allowed to change/add after this

	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		Song song = (Song) o;

		if (title == null || !title.equals(song.getTitle())) return false;
		return releaseDate != null && releaseDate.equals(song.getReleaseDate());
	}

	@Override
	public int compareTo(Song o) {
		if (equals(o)) return 0;

		int flag = title.compareTo(o.getTitle());
		if (flag != 0) return flag;

		return o.getReleaseDate().compareTo(releaseDate);
	}
}

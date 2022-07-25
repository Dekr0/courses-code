package ece325_lab_assignment5;

import java.util.Comparator;

public class SongComparator implements Comparator<Song> {
    public int compare(Song o1, Song o2) {
        return Integer.compare(o2.getPopularity(),o1.getPopularity());
    }
}
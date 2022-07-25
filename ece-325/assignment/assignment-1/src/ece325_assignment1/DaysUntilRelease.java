package ece325_assignment1;

import java.time.format.DateTimeFormatter; // For testing purpose
import java.util.Calendar;
import java.time.LocalDate; // For testing purpose

public class DaysUntilRelease {
	
	/**
	 * 	Calculate the number of days until releaseDate.
	 * @param releaseDate in the format yyyy-mm-dd (e.g., 2021-09-09)
	 * @return daysToRelease
	 */
	int calculateDaysUntilRelease(String releaseDate) {
		int daysToRelease;

		// Unpack the year, month and day from the input string.
		String[] unpackDate = releaseDate.split("-");
		int year = Integer.parseInt(unpackDate[0]);
		int month = Integer.parseInt(unpackDate[1]) - 1;
		int day = Integer.parseInt(unpackDate[2]);

		/*
			Create a Calendar object, called current, for current date time.
			Clone object current to another Calendar object, called released
			for release date time.

			This ensure the calculation is accurate in millisecond because
			input string does not provide fields such as minutes but the fields
			in object from getInstance() are filled by default.
		 */
		Calendar current = Calendar.getInstance();
		Calendar release = (Calendar) current.clone();

		// Set year, month and day.
		release.set(Calendar.YEAR, year);
		release.set(Calendar.MONTH, month);
		release.set(Calendar.DAY_OF_MONTH, day);

		if (current.compareTo(release) >= 0) {
			// Pass release day
		    daysToRelease = 0;
		} else {
			// Calculate day to release in millisecond and convert it back to day
			long releaseTime = release.getTimeInMillis();
			long currentTime = current.getTimeInMillis();
			double difference = releaseTime - currentTime;
			daysToRelease = (int) (difference / (1000d * 60d * 60d * 24d));
		}

		return daysToRelease;
	}
	
	public static void main(String[] args) {
		DaysUntilRelease d = new DaysUntilRelease();

		LocalDate now = LocalDate.now();
		LocalDate future = now.plusDays(10);
		LocalDate past = now.minusDays(16);
		LocalDate reach = past.plusDays(180);

		DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE;

		LocalDate[] testCases = {past, now, future};

		for (LocalDate testCase: testCases) {
			String releaseDate = testCase.format(formatter);

			int daysToRelease = d.calculateDaysUntilRelease(releaseDate);

			if (daysToRelease == 0) {
				System.out.println("Album was already released!");
			} else {
				System.out.printf("Release will be in %d %s\n", daysToRelease,
						daysToRelease > 1 ? "days" : "day");
			}
		}
	}
}

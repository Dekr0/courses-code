package ece325_assignment1;

import java.util.Calendar;
import java.util.GregorianCalendar;


public class DaysUntilRelease {
	
	/**
	 * 	Calculate the number of days until releaseDate.
	 * @param releaseDate in the format yyyy-mm-dd (e.g., 2021-09-09)
	 * @return
	 */
	static int calculateDaysUntilRelease(String releaseDate){
		String[] dateInfo = releaseDate.split("-");

		int year = Integer.parseInt(dateInfo[0]);
		int month = Integer.parseInt(dateInfo[1]) - 1;
		int day = Integer.parseInt(dateInfo[2]);

		Calendar release = Calendar.getInstance();
		Calendar current = Calendar.getInstance();

		release.set(Calendar.YEAR, year);
		release.set(Calendar.MONTH, month);
		release.set(Calendar.DAY_OF_MONTH, day);

		int pastRelease = release.compareTo(current);

		if (pastRelease > 0) {
			long releaseTime = release.getTimeInMillis();
			long currentTime = current.getTimeInMillis();
			double difference = releaseTime - currentTime;
			double daysToRelease = difference / (1000 * 60 * 60 * 24);
			int daysUntilRelease = daysToRelease < 1 && daysToRelease > 0 ?
					(int) Math.ceil(daysToRelease) :
					(int) Math.floor(daysToRelease);

			return daysUntilRelease;
		}

		return pastRelease;
	}
	
	public static void main(String[] args) {
		int daysUntilRelease = calculateDaysUntilRelease("2021-09-22");

		if (daysUntilRelease <= 0)
			System.out.println("Album was already released");
		else
			System.out.printf("Release will be in %d days", daysUntilRelease);
	}
}

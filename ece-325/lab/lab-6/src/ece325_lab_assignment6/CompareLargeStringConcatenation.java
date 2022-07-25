package ece325_lab_assignment6;

import java.io.FileWriter;
import java.io.IOException;

public class CompareLargeStringConcatenation {

	/**
	 * Creates a String object, performs concatOperations operations on it and returns the resulting String.
	 * @param concatOperations The number of concatenation operations to perform on the String.
	 * @return The resulting String.
	 */
	private static String concatString(int concatOperations) {
		String result = "";
		for (int i = 0; i < concatOperations; i++)
			result += "test";

		return result;
	}
	
	/**
	 * Creates a StringBuilder object, performs concatOperations operations on it, converts the StringBuilder to a String and returns the 
	 * resulting String.
	 * @param concatOperations The number of concatenation operations to perform on the StringBuilder.
	 * @return The resulting String.
	 */
	private static String concatStringBuilder(int concatOperations) {
		StringBuilder strBuilder = new StringBuilder();
		for (int i = 0; i < concatOperations; i++)
			strBuilder.append("test");

		return strBuilder.toString();
	}

	/**
	 * Performs the performance test on concatString function, displays and
	 * returns the runtime result
	 * @param numberOfStrings Number of Strings to concatenate
	 * @param measurement MillisPerformanceMeasurement Instance
	 * @return runtime result of concatString function
	 */
	public static long performanceTestConcatString(int numberOfStrings, MillisPerformanceMeasurement measurement) {
		measurement.start();
		String concat = concatString(numberOfStrings);
		measurement.end();

		long runtime = measurement.getResult();
		System.out.println("Approach 1 (String): " + runtime + " ms");

		measurement.reset();

		return runtime;
	}

	/**
	 * Performs the performance test on concatStringBuilder function, displays and
	 * returns the runtime result
	 * @param numberOfStrings Number of Strings to concatenate
	 * @param measurement MillisPerformanceMeasurement Instance
	 * @return runtime result of concatStringBuilder function
	 */
	public static long performanceTestConcatStringBuilder(int numberOfStrings, MillisPerformanceMeasurement measurement) {
		measurement.start();
		String concatByBuilder = concatStringBuilder(numberOfStrings);
		measurement.end();

		long runtime = measurement.getResult();
		System.out.println("Approach 2 (StringBuilder): " + runtime + " ms");

		measurement.reset();

		return runtime;
	}

	public static void main(String[] args) throws IOException {
		// perform your experiments here

		// Create a FileWriter object to write the test result into a .csv file
		FileWriter csvWriter = new FileWriter("CompareLargeStringConcatenation.csv");
		MillisPerformanceMeasurement measurement = new MillisPerformanceMeasurement();

		for (int numberOfStrings = 10; numberOfStrings <= 100000; numberOfStrings *= 10) {
			csvWriter.append(Integer.toString(numberOfStrings));
			csvWriter.append(",");

			System.out.println("# of concatenation operations: " + numberOfStrings);

			// Runtime of Approach 1 (String)
			long a1Runtime = performanceTestConcatString(numberOfStrings, measurement);
			csvWriter.append(Long.toString(a1Runtime));
			csvWriter.append(",");

			// Runtime of Approach 2 (StringBuilder)
			long a2Runtime = performanceTestConcatStringBuilder(numberOfStrings, measurement);
			csvWriter.append(Long.toString(a2Runtime));
			csvWriter.append("\n");

			System.out.println();
		}

		csvWriter.flush();
		csvWriter.close();
	}
}

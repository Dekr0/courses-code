package ece325_lab_assignment6;

import java.io.FileWriter;
import java.io.IOException;

public class CompareManySmallStringsConcatenation {
	/**
	 * Creates numberOfStrings String objects and performs operationsPerString concatenation
	 * operations on every string. Note that you can create one string first, then perform all
	 * the operations on that string, then create the second string, etc.
	 * @param numberOfStrings
	 * @param operationsPerString
	 */
	private static void concatString(int numberOfStrings, int concatOperationsPerString) {
		for (int i = 0; i < numberOfStrings; i++) {
			String smallerStr = "";
			for (int j = 0; j < concatOperationsPerString; j++)
				smallerStr += "test";
		}
	}

	/**
	 * Creates numberOfStrings StringBuilder objects and performs operationsPerString concatenation
	 * operations on every StringBuilder. Note that you can create one StringBuilder first, then 
	 * perform all the operations on that StringBuilder, then convert the StringBuilder to a String, 
	 * then create the second StringBuilder, etc.
	 * @param numberOfStrings
	 * @param operationsPerString
	 */
	private static void concatStringBuilder(int numberOfStrings, int concatOperationsPerString) {
		for (int i = 0; i < numberOfStrings; i++) {
				StringBuilder stringBuilder = new StringBuilder();
				for (int j = 0; j < concatOperationsPerString; j++)
					stringBuilder.append("test");
		}
	}

	/**
	 * Performs the performance test on concatString function, displays and
	 * returns the runtime result
	 * @param numberOfStrings Number of Strings to concatenate
	 * @param concatOperationsPerString Number of concatenation operations per String
	 * @param measurement MillisPerformanceMeasurement Instance
	 * @return runtime result of concatString function
	 */
	public static long performanceTestConcatString(int numberOfStrings, int concatOperationsPerString,
												   MillisPerformanceMeasurement measurement) {
		measurement.start();
		concatString(numberOfStrings, concatOperationsPerString);
		measurement.end();

		long runtime = measurement.getResult();
		System.out.println("Approach 1 (String): " + runtime + " ms");

		measurement.reset();

		return runtime;
	}

	/**
	 * Performs the performance test on concatString function, displays and
	 * returns the runtime result
	 * @param numberOfStrings Number of Strings to concatenate
	 * @param concatOperationsPerString Number of concatenation operations per String
	 * @param measurement MillisPerformanceMeasurement Instance
	 * @return runtime result of concatString function
	 */
	public static long performanceTestConcatStringBuilder(int numberOfStrings, int concatOperationsPerString,
														  MillisPerformanceMeasurement measurement) {
		measurement.start();
		concatStringBuilder(numberOfStrings, concatOperationsPerString);
		measurement.end();

		long runtime = measurement.getResult();
		System.out.println("Approach 2 (StringBuilder): " + runtime + " ms");

		measurement.reset();

		return runtime;
	}

	public static void main(String[] args) throws IOException {
		int[] numberOfStrings = {1_000, 10_000, 100_000, 1_000_000, 10_000_000, 100_000_000};
		int[] numberOfOperations = {0, 1, 2, 3, 4};

		// Create a FileWriter object to write the test result into a .csv file
		FileWriter csvWriter = new FileWriter("CompareManySmallStringsConcatenationTest1.csv");
		MillisPerformanceMeasurement measurement = new MillisPerformanceMeasurement();

		for (int n : numberOfStrings) {
			csvWriter.append(Integer.toString(n));
			for (int o : numberOfOperations) {
				System.out.println("# of Strings: " + n + "; # of Operations: " + o);

				// Runtime of Approach 1 (String)
				long a1Runtime = performanceTestConcatString(n, o, measurement);
				csvWriter.append(",");
				csvWriter.append(Long.toString(a1Runtime));

				// Runtime of Approach 2 (StringBuilder)
				long a2Runtime = performanceTestConcatStringBuilder(n, o, measurement);
				csvWriter.append(",");
				csvWriter.append(Long.toString(a2Runtime));

				System.out.println();
			}
			csvWriter.append("\n");
		}

		csvWriter.flush();
		csvWriter.close();
	}
}
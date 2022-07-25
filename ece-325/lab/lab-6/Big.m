data = readmatrix("CompareLargeStringConcatenation.csv");

numberOfStrings = log10(data(1:end, 1));
A1 = data(1:end, 2);
A2 = data(1:end, 3);

plot(numberOfStrings, A1);
hold on;
plot(numberOfStrings, A2);

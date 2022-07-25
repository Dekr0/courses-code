data = readmatrix("CompareManySmallStringsConcatenationTest1.csv");

numberOfOperations = log10(data((2:end), 1));

% a1n1 = data(1:end, 2);
a1n2 = data(2:end, 4);
a1n3 = data(2:end, 6);
a1n4 = data(2:end, 8);
a1n5 = data(2:end, 10);

% a2n1 = data(1:end, 3);
a2n2 = data(2:end, 5);
a2n3 = data(2:end, 7);
a2n4 = data(2:end, 9);
a2n5 = data(2:end, 11);

% plot(numberOfOperations, a1n1, '--o');
% hold on
plot(numberOfOperations, a1n2, '--o');
hold on
plot(numberOfOperations, a1n3, '--o');
hold on
plot(numberOfOperations, a1n4, '--o');
hold on
plot(numberOfOperations, a1n5, '--o');
hold on


% plot(numberOfOperations, a2n1, '-^');
% hold on
plot(numberOfOperations, a2n2, '-^');
hold on
plot(numberOfOperations, a2n3, '-^');
hold on
plot(numberOfOperations, a2n4, '-^');
hold on
plot(numberOfOperations, a2n5, '-^');
% hold off;

title('Runtime of Approach 1 (String) and Approach 2 (StringBuilder) for Small Strings Concatenation');
xlabel('Number of Strings (log10 Scale)');
ylabel('Runtime (ms)');
legend( '1 Operations (A1)', '2 Operations (A1)', '3 Operations (A1)', '4 Operations (A1)', '1 Operations (A2)', '2 Operations (A2)', '3 Operations (A2)', '4 Operations (A2)');

% plot(numberOfOperations, a1n1, '--o');
% hold on;
% plot(numberOfOperations, a2n1, '--o');
% title('Runtime of Two Concatenation Approaches (No concatenation operations)');
% xlabel('Number of Strings (log10 Scale)');
% ylabel('Runtime (ms)');
% legend('Approach 1 (String)', 'Approach 2 (StringBuilder)');

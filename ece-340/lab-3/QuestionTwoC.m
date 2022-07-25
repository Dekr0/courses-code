n = (0:25);
h1 = 3.6 * 1.25 .^ n;
h1(1) = h1(1) + -1.6;

h2 = 4.5 * 0.8 .^ n;
h2(1) = h2(1) + -2.5;

stem(n, h1);
title('Plot for impulse response h1[n]');
xlabel('n');

stem(n, h2);
title('Plot for impulse response h2[n]');
xlabel('n');

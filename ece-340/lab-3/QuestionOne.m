n = (0:1:10);
h1 = n .* 0.5 .^ n .* sin(pi / 6 .* n);

x = zeros(1, 10);
x(1) = 1;
N = [-4 0 1];
D = [16 -16*sqrt(3) 20 -4*sqrt(3) 1];
h2 = filter(N, D, x);

stem(n, h1, 'r-');
hold on
stem(h2, 'b*');
title('h1(n) and h2(n)');
xlabel('n');
legend({'h1(n)', 'h2(n)'}, 'Location', 'southwest');

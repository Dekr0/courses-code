k = (0:1:4);
x = k;

h = zeros(1,4) + 2 - k(1:4);

tiledlayout(2,1);
ax1 = nexttile;
stem(ax1, k, x);
title('Plot of x[k]', 'Fontsize', 16);
xlabel('k', 'Fontsize', 16);
ylabel('x[k]', 'Fontsize', 16);

ax2 = nexttile;
stem(ax2, k(1:4), h);
title('Plot of h[k]', 'Fontsize', 16);
xlabel('k', 'Fontsize', 16);
ylabel('h[k]', 'Fontsize', 16);

xh = conv(h, x);
tiledlayout(1,1);
stem(xh);
title('Plot of  convolution output', 'Fontsize', 16);
xlabel('k', 'Fontsize', 16);
ylabel('x[k] * h[k]', 'Fontsize', 16);
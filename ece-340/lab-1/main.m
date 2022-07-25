x = zeros(1, 50) + 1;
y1 = sysresp(x, 0.2);

ax1 = nexttile;
stem(ax1, (1:50), y1);
title('Plot of y[k] (a = 0.2)', 'Fontsize', 20);
xlabel('k', 'Fontsize', 20);
ylabel('y[k]', 'Fontsize', 20);
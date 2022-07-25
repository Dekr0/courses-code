n1 = (0:1:30);
fs1 = 100;
y1 = cos(20 .* pi .* n1 ./ fs1);
y2 = cos(180 .* pi .* n1 ./ fs1);
y3 = cos(220 .* pi .* n1 ./ fs1);

tiledlayout(2,1);
ax1 = nexttile;
stem(ax1, n1, y1);
title('Plot of y1[n]', 'Fontsize', 16);
xlabel('n', 'Fontsize', 16);
ylabel('y1[n]', 'Fontsize', 16);
ax2 = nexttile;
stem(ax2, n1, y3);
title('Plot of y3[n]', 'Fontsize', 16);
xlabel('n', 'Fontsize', 16);
ylabel('y2[n]', 'Fontsize', 16);

n2 = (0:1:300);
fs2 = 1000;
z1 = cos(20 .* pi .* n2 ./ fs2);
z2 = cos(180 .* pi .* n2 ./ fs2);

tiledlayout(2,1);
ax1 = nexttile;
stem(ax1, n2, z1);
title('Plot of z1[n]', 'Fontsize', 16);
xlabel('n', 'Fontsize', 16);
ylabel('z1[n]', 'Fontsize', 16);
ax2 = nexttile;
stem(ax2, n2, z2);
title('Plot of z2[n]', 'Fontsize', 16);
xlabel('n', 'Fontsize', 16);
ylabel('z2[n]', 'Fontsize', 16);

subplot(2,1,1);
plot(n2/fs2,z1,'r-', n1/fs1,y1,'b+'); 
xlabel('n'); ylabel('y_1[n] and z_1[n]'); 
legend('z_1[n]','y_1[n]');
subplot(2,1,2);
plot(n2/fs2,z2,'r-', n1/fs1,y2,'b+');
xlabel('n'); ylabel('y_2[n] and z_2[n]'); 
legend('z_2[n]','y_2[n]');



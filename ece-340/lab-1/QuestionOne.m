% initialize input vector for k1 and k2
k1 = (10:40);
k2 = (0:100);

% output vector x1 and x2 with input k1 and k2 respectively
x1 = -5.1 * sin(0.1 * pi * k1 - 3 * pi / 4) + 1.1 * cos(0.4 * pi * k1);
x2 = (-0.9 .* k2) .* exp(1j * pi * k2 / 10);

realX2 = real(x2);  % real part of x2[k]
imagX2 = imag(x2);  % imaginary part of x2[k]

% Set the plot layout. Placing 3 different graph separately in a vertical 
% manner
tiledlayout(3,1);

% plot of x1[k]
ax1 = nexttile;
plot(ax1, k1, x1);


% plot of real part of x2[k]
ax2 = nexttile;
plot(ax2, k2, realX2);


% plot of imaginary part of x2[k]
ax3 = nexttile;
plot(ax3, k2, imagX2);


E1 = sum(abs(x1.^2)); % x1[k] energy
E2 = sum(abs(x2.^2)); % x2[k] energy
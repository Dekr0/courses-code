k = (0:1:50);
sincPart = 0.3 .* sinc(0.3 .* (k - 25));
cosPart = 0.54 - 0.46 .* cos(2 .* pi .* k ./ 50 );
h = sincPart .* cosPart;

stem(h);
title('Plot of h[k]', 'Fontsize', 16);
xlabel('k', 'Fontsize', 16);
ylabel('h[k]', 'Fontsize', 16);

% Change in quality of the audio file
[x3, Fs] = audioread("baila.wav");
x3h = conv(x3, h);

audiowrite("baila_filtered.wav", x3h, Fs);

b1 = [2 2];
a1 = [1 -1.25];
[z1, p1, k1] = tf2zpk(b1, a1);

b2 = [2 2];
a2 = [1 -0.8];
[z2, p2, k2] = tf2zpk(b2, a2);

zplane(z1, p1);
title('Pole-zero diagram for H1(z)');
xlabel('Real axis');
ylabel('Imaginary axis');

zplane(z2, p2);
title('Pole-zero diagram for H2(z)');
xlabel('Real axis');
ylabel('Imaginary axis');

w = (0:0.01:2*pi());
H1 = (2 + 2 .* exp(-1j .* w)) ./ (1 - 1.25 .* exp(-1j .* w));
H2 = (2 + 2 .* exp(-1j .* w)) ./ (1 - 0.8 .* exp(-1j .* w));

magH1 = abs(H1);
magH2 = abs(H2);

phaseH1 = angle(H1);
phaseH2 = angle(H2);

%subplot(2, 1, 1);
%plot(w, magH1);
%title('Magnitude of the frequency response of H1(z)');
%xlabel('w');
%ylabel('|H1(z)|');

%subplot(2, 1, 2);
%plot(w, phaseH1);
%title('Phase of the frequency response of H1(z)');
%xlabel('w');
%ylabel('angle(H1(z))');

subplot(2, 1, 1);
plot(w, magH2);
title('Magnitude of the frequency response of H2(z)');
xlabel('w');
ylabel('|H2(z)|');

subplot(2, 1, 2);
plot(w, phaseH2);
title('Phase of the frequency response of H2(z)');
xlabel('w');
ylabel('angle(H2(z))');
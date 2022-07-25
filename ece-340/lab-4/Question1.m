[x, Fs] = audioread("love_mono22.wav");
bit = 8;
bitRate = Fs * bit; % sample / seconds * bits / sample = bits / seconds
duration = length(x) / Fs; % number of samples / (sample / secs) = secs

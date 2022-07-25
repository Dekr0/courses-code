lena = imread("lena.jpg"); % Read .jpg file into a matrix
[row, column] = size(lena); % Return the number of row and column
maxPixel = max(max(lena)); % Find the maximum pixel
lena_bright = lena + 30; % Create a brighter version of the .jpg file

% Write the matrix into a .jpg file
imwrite(lena_bright,'lena_bright.jpg','jpg','Quality', 100) ;
Img = imread('barbaraLarge.jpg');
figure,  imshow(Img); title('Original Barbara Image'), colorbar;

resize_factor = [0.9, 0.7, 0.5];
for i = resize_factor(1:3)
    resizeImg = imresize(Img, i, 'nearest', 'antialiasing', 0);
    resizeImgAA = imresize(Img, i, 'nearest', 'antialiasing', 1);
    str = sprintf('Barbara Image resized by %f of original size without anti-aliasing', i);
    strA = sprintf('Barbara Image resized by %f of original size with anti-aliasing', i);
    figure, imshow(resizeImg); title(str), colorbar;
    figure, imshow(resizeImgAA); title(strA), colorbar;
end

im1 = im2single(imread('img1.pgm'));
im2 = im2single(imread('img2.pgm'));

n = 10;
p = 4;

disp('Estimaging transformation...')
[ M, t ] = computeAffineTransformation(im1, im2, n, p, false);

disp('Transforming image...')
own = transformImage(im2, M, t);

imshow(im1)
imshow(own)
left = im2single(rgb2gray(imread('left.jpg')));
right = im2single(rgb2gray(imread('right.jpg')));

n = 18;
p = 4;

[ M, t ] = computeAffineTransformation(left, right, n, p, false);

M = inv(M);
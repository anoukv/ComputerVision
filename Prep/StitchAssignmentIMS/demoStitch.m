% this is all very similar to demoAlignment()

left = im2single(rgb2gray(imread('left.jpg')));
right = im2single(rgb2gray(imread('right.jpg')));

n = 10;
p = 4;

[ M, t ] = computeAffineTransformation(left, right, n, p, false);

M

% M = [ M(1,1), M(1,2); M(2,1) M(2,2) ];

M

T = maketform('affine', [M; t']);
[rightNew, XDATA, YDATA] = imtransform(right, T);

rightNew = rightNew';

t = abs(ceil(t));

% Get the four corners of the transpositioned right image.
% Three corners are padding and the fourth is the rotated and scaled right
% image
A = zeros(t(1), t(2));
B = zeros(size(rightNew, 1), t(2));
C = zeros(t(1), size(rightNew, 2));
D = rightNew;

row1 = [A;B]';
row2 = [C;D]';

% Combine the rows.
rightTranslated = [row2; row1];

% get a copy of the left image in a larger frame.
leftResampled = zeros(size(rightTranslated));
leftResampled(1:size(left,1), 1:size(left,2)) = left;

subplot(1, 1, 1);
imshow(max(leftResampled,rightTranslated), []);
title('home made');



clear();

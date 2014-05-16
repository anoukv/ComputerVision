I1 = imresize(im2single(rgb2gray(imread('obj02_001.png'))), 0.25);
I2 = imresize(im2single(rgb2gray(imread('obj02_002.png'))), 0.25);
[coords1, coords2] = get_foreground_matches(I1, I2);
plotMatches(I1, I2, coords1, coords2);
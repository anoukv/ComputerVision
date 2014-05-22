clear();
I1 = imresize(im2single(rgb2gray(imread('obj02_001.png'))), 0.25);
I2 = imresize(im2single(rgb2gray(imread('obj02_002.png'))), 0.25);
[coords1, coords2] = get_foreground_matches(I1, I2);

coords1 = center(coords1);
coords2 = center(coords2);

% now we need to do this for multiple points using chaining.
% A number of issues:
% we did not save the actual points/coordinates, that is slightly 
% unfortunate but we can probably reason about that since we are saving
% the 'even' frames I believe.
% Then, how do we visualzie this thing? Is S supposed to be a teddy bear?
% From the assignment: "Remember to enable a sufficient number of points 
% that persist throughout the sequence to perform the factorization on a 
% dense matrix. There is no need to fill in missing data for this problem.
[M, S] = factorizaion(coords1, coords2)

%plotMatches(I1, I2, coords1, coords2);
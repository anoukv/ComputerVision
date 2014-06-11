function [ coordinates1, coordinates2 ] = get_foreground_matches( image1, image2 )

[frames1, desc1] = vl_sift(image1);
[frames2, desc2] = vl_sift(image2);

foreground1 = getForeground(image1);
foreground2 = getForeground(image2);

[frames1, desc1] = dropBackgroundPoints(foreground1, frames1, desc1);
[frames2, desc2] = dropBackgroundPoints(foreground2, frames2, desc2);

[matches] = vl_ubcmatch(desc1, desc2);

% matches should be >= 8 (enforce later)

coordinates1 = frames1([1, 2], matches(1, :));
coordinates2 = frames2([1, 2], matches(2, :));

end

function [newFrames, newDesc] = dropBackgroundPoints(foreground, frames, desc)

% initialize array for indices that are not background
ind = zeros(1, size(frames, 2));

% for every detected interest point
% get x & y coordinates
% check if they are in the foreground, if not so set the index to 1
for i=1:size(frames, 2)
   y = floor(frames(1, i));
   x = floor(frames(2, i));
   if foreground(x, y) ~= 1
       ind(i) = 1;
   end
end
% copy frames and desc to new variables
newFrames = frames;
newDesc = desc;

% at every place where ind == 1 (i.e. point is in the backggournd), 
%delete that point in both descriptors and frames (find(ind) corresponds to
% columns)
newFrames(:, find(ind)) = [];
newDesc(:, find(ind)) = [];

end

function [foreground] = getForeground(I)

% this mask works for the teddy bear
mask = zeros(size(I));
mask(150:end-150, 150:end-150) = 1;

bw = activecontour(I, mask);

[r, c] = find(bw);
foreground = zeros(size(I));
foreground(min(r):max(r), min(c):max(c)) = 1;

end


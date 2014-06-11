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
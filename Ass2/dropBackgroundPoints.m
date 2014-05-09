function [newFrames, newDesc] = dropBackgroundPoints(foreground, frames, desc)

ind = zeros(1, size(frames, 2));

for i=1:size(frames, 2)
   y = floor(frames(1, i));
   x = floor(frames(2, i));
   if foreground(x, y) ~= 1
       ind(i) = 1;
   end
end

newFrames = frames;
newDesc = desc;
newFrames(:, find(ind)) = [];
newDesc(:, find(ind)) = [];

end
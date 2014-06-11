function [foreground] = getForeground(I)

% this mask works for the teddy bear
mask = zeros(size(I));
mask(150:end-150, 150:end-150) = 1;

% get the active contour, resulting in black and white image (white is
% foreground)
bw = activecontour(I, mask);

% find the (row, colum) where foreground is found (i.e. bw(index) == 1)
[r, c] = find(bw);

% initialize everything as background (0)
foreground = zeros(size(I));

% set a bounding box to 1, starting from min(row) and min(col) to max(row)
% and max(col)
foreground(min(r):max(r), min(c):max(c)) = 1;

end


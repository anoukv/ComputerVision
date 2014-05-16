function [foreground] = getForeground(I)

% this mask works for the teddy bear
mask = zeros(size(I));
mask(150:end-150, 150:end-150) = 1;

bw = activecontour(I, mask);

[r, c] = find(bw);
foreground = zeros(size(I));
foreground(min(r):max(r), min(c):max(c)) = 1;

end


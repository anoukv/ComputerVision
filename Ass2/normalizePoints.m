function [ normalizedPoints, T ] = normalizePoints( points )
mx = mean(points(1, :));
my = mean(points(2, :));
mxMatrix = repmat(mx, 1, size(points, 2));
myMatrix = repmat(my, 1, size(points, 2));

d = mean(sqrt(sum((points - [mxMatrix;myMatrix]).^2)));
T = [sqrt(2) / d, 0, -mx * sqrt(2) / d; 0, sqrt(2)/d, -my * sqrt(2) / d; 0, 0, 1];

% I needed to add homogeneous coordinates to make the dimensions happy.
normalizedPoints = T * [points;ones(1, size(points, 2))];

end

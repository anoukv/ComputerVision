function [ normalizedPoints, T ] = normalizePoints( points )
% get the mean
mx = mean(points(1, :));
my = mean(points(2, :));

% repeat the mean to form a matrix
mxMatrix = repmat(mx, 1, size(points, 2));
myMatrix = repmat(my, 1, size(points, 2));

% compute d
d = mean(sqrt(sum((points - [mxMatrix;myMatrix]).^2)));

% construct T
T = [sqrt(2) / d, 0, -mx * sqrt(2) / d; 0, sqrt(2)/d, -my * sqrt(2) / d; 0, 0, 1];

% Needed to add homogeneous coordinates to make the dimensions happy.
normalizedPoints = T * [points;ones(1, size(points, 2))];

end

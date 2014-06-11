function [ centeredPoints ] = center( points )
% get the mean of the points
mu = mean(points, 2);
% subtract the mean from the points to center
centeredPoints = points - repmat(mu, 1, size(points,2));


end


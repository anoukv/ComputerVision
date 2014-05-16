function [ centeredPoints ] = center( points )
mu = mean(points')';
centeredPoints = points - repmat(mu, 1, size(points,2))


end


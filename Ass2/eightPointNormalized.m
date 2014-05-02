function [ F ] = eightPointNormalized( coords1, coords2 )

% number of matches
n = size(coords1, 2);

% normalize points
coords1 = normalizePoints(coords1);
coords2 = normalizePoints(coords2);

% construct A (not very pretty, better formatting?)
A = [coords1(1, :)' .* coords2(1, :)', coords1(1, :)' .* coords2(2, :)', coords1(1, :)', coords1(2, :)' .* coords2(1, :)', coords1(2, :)' .* coords2(2, :)', coords1(2, :)', coords2(1, :)', coords2(2, :)', ones(n, 1)];

% do SVD, get V
[~, ~, V] = svd(A);

% take the last column of V (corresponds to smallest singular value)
V = V(:,end);

% reshape that column to get F
F = reshape(V, 3, 3)';

% do SVD on F
[Uf, Df, Vf] = svd(F);

% set smallest singular value of D to 0, recompute F
F = Uf * diag([Df(1, 1), Df(2, 2), 0]) * Vf';

end

function [ normalizedPoints ] = normalizePoints( points )
mx = mean(points(1, :));
my = mean(points(2, :));
mxMatrix = repmat(mx, 1, size(points, 2));
myMatrix = repmat(my, 1, size(points, 2));

d = mean(sqrt(sum((points - [mxMatrix;myMatrix]).^2)));
T = [sqrt(2) / d, 0, -mx * sqrt(2) / d; 0, sqrt(2)/d, -my * sqrt(2) / d; 0, 0, 1];

% I needed to add homogeneous coordinates to make the dimensions happy.
normalizedPoints = T * [points;ones(1, size(points, 2))];

end


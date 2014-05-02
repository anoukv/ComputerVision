function [ F ] = eightPointNormalized( coords1, coords2 )

% number of matches
n = size(coords1, 2);

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


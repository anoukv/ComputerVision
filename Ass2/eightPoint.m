function [ F ] = eightPoint( coords1, coords2 )

n = size(coords1, 2);

A = [coords1(1, :)' .* coords2(1, :)', coords1(1, :)' .* coords2(2, :)', coords1(1, :)', coords1(2, :)' .* coords2(1, :)', coords1(2, :)' .* coords2(2, :)', coords1(2, :)', coords2(1, :)', coords2(2, :)', ones(n, 1)];

[~, E, V] = svd(A);

V = V(:,end);

F = reshape(V, 3, 3)'

[U,D,V] = svd(F);
V = V';
D(3,3) = 0;
F = U * D * V

end


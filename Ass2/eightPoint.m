function [ F ] = eightPoint( coords1, coords2 )

n = size(coords1, 2);

A = [coords1(1, :)' .* coords2(1, :)', coords1(1, :)' .* coords2(2, :)', coords1(1, :)', coords1(2, :)' .* coords2(1, :)', coords1(2, :)' .* coords2(2, :)', coords1(2, :)', coords2(1, :)', coords2(2, :)', ones(n, 1)];

%size(A)

[U, D, V] = svd(A);


V = V(:,end);

%averageSolution = sum(A*V) / n

F = reshape(V, 3, 3)'

[Uf, Df, Vf] = svd(F);

F = Uf * diag([Df(1, 1), Df(2, 2), 0]) * Vf'

end


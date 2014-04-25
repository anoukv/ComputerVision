function [ F ] = eightPoint( coords1, coords2 )

n = size(coords, 2);

A = [coords1(1, :)' * coords2(1, :)', coords1(1, :)' * coords2(2, :)', coords1(1, :)', coords1(2, :)'* coords2(1, :)', coords1(2, :)'*coords2(2, :)', coords1(2, :)', coords2(1, :)', coords2(2, :)', ones(n, 1)];

end


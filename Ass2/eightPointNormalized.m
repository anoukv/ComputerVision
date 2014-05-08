function [ F ] = eightPointNormalized( coords1, coords2 )

% normalize points
[coords1, T] = normalizePoints(coords1);
[coords2, Tp] = normalizePoints(coords2);

% Do regular eightPoint on normalized data.
F = eightPoint(coords1, coords2);

% denormalization
F = Tp'*F*T;

end


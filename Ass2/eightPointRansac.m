function [ F ] = eightPointRansac( matches1, matches2, numberOfRounds, inlierTrheshold )

% number of matches
n = size(matches1, 2);

% normalize points
[matches1, T] = normalizePoints(matches1);
[matches2, Tp] = normalizePoints(matches2);

inliers = zeros(1, n);

for i=1:numberOfRounds
    
    % pick 8 random points: 
    indices = randperm(n, 8);
    coords1 = matches1(:, indices);
    coords2 = matches2(:, indices);

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
    
    get = zeros(1, n);
    
    for index=1:n
        
        % make it homogenous
        pi = [matches1(:, index); 1];
        pip = [matches2(:, index); 1];
        
        numerator = (pip' * F * pi)^2;
        Fpi = F * pi;
        Fpip = F' * pip;
        
        denominator = Fpi(1)^2 + Fpi(2)^2 + Fpip(1)^2 + Fpip(2)^2;
        
        d = numerator / denominator;
        if d < inlierThreshold:
            get(index) = 1;
        end
        
    end
    
    if sum(get) > sum(inliers):
        inliers = get;
    end
    
end

indices = zeros(1, sum(inliers));
indexer = 1;
for i=1:n:
    if get(i) == 1:
        indices(indexer) = i;
        indexer = indexer + 1;
    end
end

coords1 = matches1(:, indices);
coords2 = matches2(:, indices);

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

% AND FINALLY denormalization
F = Tp'*F*T;
    
end

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


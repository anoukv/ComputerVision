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

    % Do regular eightPoint on the ranseced normalized data.
    F = eightPoint( coords1, coords2 );
    
    get = zeros(1, n);
    
    for index=1:n
        % make it homogenous
        pi = [matches1(:, index)];
        pip = [matches2(:, index)];
        
        numerator = (pip' * F * pi)^2;
        
        Fpi = F * pi;
        Fpip = F' * pip;
        denominator = Fpi(1)^2 + Fpi(2)^2 + Fpip(1)^2 + Fpip(2)^2;
        
        d = numerator / denominator;
        
        if d < inlierTrheshold
            get(index) = 1;
        end
    end
    
    if sum(get) > sum(inliers)
        inliers = get;
    end
    
end

indices = zeros(1, sum(inliers));
indexer = 1;
for i=1:n
    if inliers(i) == 1
        indices(indexer) = i;
        indexer = indexer + 1;
    end
end

coords1 = matches1(:, indices);
coords2 = matches2(:, indices);

% Do regular eightPoint on the ranseced normalized data.
F = eightPoint( coords1, coords2 );

% AND FINALLY denormalization
F = Tp'*F*T;
    
end




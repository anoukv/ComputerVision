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
        
        % compute d
        numerator = (pip' * F * pi)^2;
        
        Fpi = F * pi;
        Fpip = F' * pip;
        denominator = Fpi(1)^2 + Fpi(2)^2 + Fpip(1)^2 + Fpip(2)^2;
        
        d = numerator / denominator;
        
        % if d < threshold, set get(index) to 1
        % indicating that this column 1 is an inlying point
        if d < inlierTrheshold
            get(index) = 1;
        end
    end
    
    % if the number of inliers exceeds the previous number
    % of inliers, set inliers to get remembering which points were inliers.
    if sum(get) > sum(inliers)
        inliers = get;
    end
    
end

% get inlying coords
coords1 = matches1(:, find(inliers));
coords2 = matches2(:, find(inliers));

% Do regular eightPoint on the ranseced normalized data.
F = eightPoint( coords1, coords2 );

% AND FINALLY denormalization
F = Tp'*F*T;
    
end




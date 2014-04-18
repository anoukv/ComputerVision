function [ R, t ] = icp( base, target, iterations )

% initialize Rotation and translation
R = eye(3, 3);
t = zeros(3, 1);

% iterate (iterations) times
for i=1:iterations
    % find closest point for each point in base
    % to point in target
    
    estimated_target = R * base;
    estimated_target = estimated_target - repmat(t,1,size(base,2));
    
    kdtree = vl_kdtreebuild(estimated_target);
    
    closest_points = zeros(size(base));
    for j=1:size(base,2)
        tar = target(:,j);
        [index, ~] = vl_kdtreequery(kdtree, estimated_target, tar);
        closest_points(:,j) = estimated_target(:,index);
    end
    dist = RMS(estimated_target, closest_points)
    % refine R and t through SVD
    
    % these should be ONLY the matched points, 
    % change base/target, to matched base/target!!!!!
    muBase = sum(base, 2)/size(base, 2);
    muTarget = sum(target, 2)/size(target, 2);
    
    muBaseMatrix = repmat(muBase, 1, size(base, 2));
    muTargetMatrix = repmat(muTarget, 1, size(target, 2));
    
    % adjust base and target
    
    baseAdjusted = base - muBaseMatrix;
    targetAdjusted = base - muTargetMatrix;
    
    % construct A
    A = baseAdjusted * targetAdjusted';
    
    % perform SVD
    [U, E, V] = svd(A);
    
    % compute rotation
    R = U*V';
    
    % compute translation
    t = muBase' - muTarget' * R;
    t = t';
      
end


end


function [R, t, distance] = icp(base,target,iter)

numberOfPoints = size(target,2);

transformed_target = target;

R = eye(3,3);
t = zeros(3,1);

for i=1:iter
    
    % find closest point for each point in base
    % to point in target
    matches = getMatches(base,transformed_target);
        
    % get the RMS
    distance = RMS(base, matches)

    % get the refinement for R and t
    [R_temp,t_temp] = getTransforms(matches, transformed_target);
    
    % perofrm transformations
    R = R_temp*R;
    t = R_temp*t+t_temp;

    % transform the target again.
    transformed_target = R * target + repmat(t, 1, numberOfPoints);
    
end
    
function [closest_points] = getMatches(base, target)
    
    kdtree = vl_kdtreebuild(target);
    
    closest_points = zeros(size(base));
    
    for j=1:size(base,2)
        point = base(:,j);
        [index, ~] = vl_kdtreequery(kdtree, target, point);
        closest_points(:,j) = target(:,index);
    end

  
function [R,t] = getTransforms(base,target)
    % refine R and t through SVD
    
    % get geometric mean 
    muBase = sum(base, 2)/size(base, 2);
    muTarget = sum(target, 2)/size(target, 2);
    
    % turn getometric mean into tranlsation 
    muBaseMatrix = repmat(muBase, 1, size(base, 2));
    muTargetMatrix = repmat(muTarget, 1, size(target, 2));
    
    % adjust base and target
    baseAdjusted = base - muBaseMatrix;
    targetAdjusted = target - muTargetMatrix;
    
    % construct A
    A = baseAdjusted * targetAdjusted';
    
    % perform SVD
    [U, ~, V] = svd(A);
    
    % get rotation
    R = U*V';
    
    % get translation
    t = muBase' - muTarget' * R;
    t = t';
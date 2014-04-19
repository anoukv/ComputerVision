function [ R, t ] = icp_ws( set1, set2, iterations, R, t )

kdtree = vl_kdtreebuild(set2);

for i=1:iterations
    
    % transform set1 according to new transformations
    transformed_set1 = R * set1 + repmat(t, 1, size(set1, 2));
    
    % find closest point for each point in base
    matches = getMatches(transformed_set1, set2, kdtree);
    
    % get the refinement for R and t
    [R, t] = getTransformation(matches, set1);
    
    % get the RMS
    rms = RMS(transformed_set1, matches)
    
end


function [matches] = getMatches(set1, set2, kdtree)
    
    matches = zeros(size(set1));
    
    for j=1:size(set1,2)
        point = set1(:,j);
        [index, ~] = vl_kdtreequery(kdtree, set2, point);
        matches(:,j) = set2(:,index);
    end

  
function [R,t] = getTransformation(base,target)
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
    t = muTarget' * R - muBase';
    t = t';
    
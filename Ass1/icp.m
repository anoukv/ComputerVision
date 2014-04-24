function [ R, t ] = icp( set1, set2, data_fractions )

R = eye(3, 3);
t = zeros(3, 1);

for i=1:size(data_fractions, 1)
    
	sample1 = random_data_sampler(set1, data_fractions(i));
    sample2 = random_data_sampler(set2, data_fractions(i));
    
    %sample1 = uniform_data_sampler(set1, data_fractions(i));
    %sample2 = uniform_data_sampler(set2, data_fractions(i));
    
    kdtree = vl_kdtreebuild(sample2);
    
    % transform set1 according to new transformations
    transformed_sample1 = R * sample1 + repmat(t, 1, size(sample1, 2));
    
    % find closest point for each point in base
    matches = getMatches(transformed_sample1, sample2, kdtree);
    
    % get the refinement for R and t
    [R, t] = getTransformation(matches, sample1);
    
    % get the RMS
    rms = RMS(transformed_sample1, matches)
    
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
    %t = muBase' - muTarget' * R ;
    t = t';
    
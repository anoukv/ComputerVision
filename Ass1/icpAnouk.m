function [ R, t ] = icpAnouk( set1, set2, data_fractions )

R = eye(3, 3);
t = zeros(3, 1);

prevRMS = 100;

for i=1:size(data_fractions, 1)
    sample1 = uniform_data_sampler(set1, data_fractions(i));
    sample2 = uniform_data_sampler(set2, data_fractions(i));
    % transform set1 according to new transformations
    transformed_sample1 = R * sample1 + repmat(t, 1, size(sample1, 2));

    % find closest point for each point in base
    matches = getMatches(transformed_sample1, sample2);
    
    % get the refinement for R and t
    [R_temp, t_temp] = getTransformation(matches, transformed_sample1);
    
    % get the RMS
    rms = RMS(transformed_sample1, matches)
    
    if rms > prevRMS
        break
    else
        prevRMS = rms;
    end
    
    % accumulate rotations and translations
    R = R_temp*R;
    t = R_temp*t+t_temp;
    
    figure
    plotSurfaces(transformed_sample1, sample2);
    
    
end
close all

function [matches] = getMatches(set1, set2)
    % build kdtree
    kdtree = vl_kdtreebuild(set2);
    
    % we will find a match for every point in set1
    matches = zeros(size(set1));
    
    % for every point in set1
    % find the closest point in set2
    % add this to the matches
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
    t = muBase' - muTarget' * R;
    
    t = t';
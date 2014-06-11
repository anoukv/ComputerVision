function [t, R] = icp(target, base, iter, sampler)

% initialize t and R
t = zeros(3,1);
R = eye(3,3);

% for all sample sizes perform ICP
for k=1:size(iter, 2)
    
    % get a sample from the base and target
    sampleBase = sample(base, iter(k), sampler);
    sampleTarget = sample(target, iter(k), sampler);
    
    % transform base by previous rotation and translation
    baseTransformed = R * sampleBase + repmat(t, 1, size(sampleBase, 2));
    
    % get matches between the transformed base and the target
    matches = getMatches(baseTransformed, sampleTarget);
    
    % get transformation through SVD
    [R_temp,t_temp] = getTransformation(matches, baseTransformed);
    
    % refine rotation and translation
    R = R_temp * R;
    t = R_temp * t + t_temp;
    
    % calculate rms
    rms = RMS(matches, baseTransformed)
end
end


function [R,t] = getTransformation(target,base)
% get mean from base and mean from target, correct    
mu_base = mean(base, 2);
base_new = base - repmat(mu_base, 1, size(base, 2));
mu_target = mean(target, 2);
target_new = target - repmat(mu_target, 1, size(target, 2));

% compute A
A = base_new*target_new'; 

% perform SVD
[U,~,V] = svd(A); 

% return R and t
R = V*U';
t = mu_target - R*mu_base;
end
    
function [matches] = getMatches(set1, set2)
% build kdtree for set2
kdtree = vl_kdtreebuild(set2);

% initialize empty matches
matches = zeros(size(set1));

% for every point in set1
for j=1:size(set1,2)
    point = set1(:,j);
    % find closest point in set2
    [index, ~] = vl_kdtreequery(kdtree, set2, point);
    % save point to matches
    matches(:,j) = set2(:,index);
end
end

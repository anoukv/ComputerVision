function [t, R] = icp(target,base,iter)

Np = size(base,2);

baseTransformed = base;

t = zeros(3,1);
R = eye(3,3);

for k=1:iter
    matches = getMatches(baseTransformed, target);
    [R_temp,t_temp] = getTransformation(matches, baseTransformed);
    R = R_temp * R;
    t = R_temp * t + t_temp;
    baseTransformed = R * base + repmat(t, 1, Np);
    rms = RMS(matches, baseTransformed)
end
end


function [R,t] = getTransformation(target,base)
    mu_base = mean(base, 2);
    base_new = base - repmat(mu_base, 1, size(base, 2));
    mu_target = mean(target, 2);
    target_new = target - repmat(mu_target, 1, size(target, 2));
    N = base_new*target_new'; 
    [U,~,V] = svd(N); 
    R = V*U';
    t = mu_target - R*mu_base;
end
    
function [matches] = getMatches(set1, set2)
    kdtree = vl_kdtreebuild(set2);
    matches = zeros(size(set1));
    for j=1:size(set1,2)
        point = set1(:,j);
        [index, ~] = vl_kdtreequery(kdtree, set2, point);
        matches(:,j) = set2(:,index);
    end
end

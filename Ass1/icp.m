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
    
    size(estimated_target)
    kdtree = vl_kdtreebuild(estimated_target);
    
    closest_points = zeros(size(base));
    distance = 0;
    for j=1:size(base,1)
        tar = target(:,i)
        [index, dist] = vl_kdtreequery(kdtree, estimated_target, tar);
        closest_points(i,:) = estimated_target(index,:);
        distance = distance + dist;
    end
    distance
    dist = RMS(estimated_target, closest_points)
    
    % refine R and t through SVD
    
end


end


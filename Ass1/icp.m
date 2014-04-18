function [ R, t ] = icp( base, target, iterations )

% initialize Rotation and translation
R = eye(3, 3);
t = zeros(3, 1);

% iterate (iterations) times
for i=1:iterations
    % find closest point for each point in base
    % to point in target
    estimated_target = R * base - t;
    kdtree = vl_kdtreebuild(estimated_target);
    
    closest_points = zeros(size(estimated_target));
    for j=1:size(estimated_target,1)
        [index, ~] = vl_kdtreequery(kdtree, estimated_target, target(i,:));
        closest_points(i,:) = estimated_target(index,:);
    end
    dist = RMS(estimated_target, closest_points)
    
    % refine R and t through SVD
    
end


end


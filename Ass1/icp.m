function [ R, t ] = icp( base, target, iterations )

% initialize Rotation and translation
R = eye(3, 3);
t = zeros(3, 1);

% iterate (iterations) times
for i=1:iterations

    % find closest point for each point in base
    % to point in target
    
    % refine R and t through SVD
    
end


end


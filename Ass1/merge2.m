function [] = merge2( stepSize, numberOfImages, prefix, sampler )
% close all figures
close all;

% read the first pcd
current = read_body(0, prefix);

% initialzize rotations accumulated (Rac) and translation accumulated (tac)
Rac = zeros(3, 3, numberOfImages);
tac = zeros(3, 1, numberOfImages);

% start at the zeroth point cloud
i = 0;
RacTacIndex = 1;

% while we have not reached the number of images
while i < numberOfImages
    % increase the previous image with stepsize
    i = i + stepSize 

    % read the new point cloud
    new = read_body(i, prefix);
    
    % for all previous rotations and translations (+ current) transform new
    % by the recorded translation
    for j = -RacTacIndex:-1
        prevRacTacIndex = abs(j);
        new = Rac(:, :, prevRacTacIndex) * new + repmat(tac(:, :, prevRacTacIndex), 1, size(new, 2));
    end
        
    % perform icp between current and new
    [t, R]  = icp(current, new, [0.01, 0.02, 0.03, 0.1], sampler);
    
    new = R * new + repmat(t, 1, size(new, 2));
    
    % set current = new for next iteration
    current = [current'; new']';

    % store rotation and translation
    Rac(:, :, RacTacIndex) = R;
    tac(:, :, RacTacIndex) = t;

    % increase the RacTacIndex
    RacTacIndex = RacTacIndex + 1;
end

figure;
plotSurface(current);


end


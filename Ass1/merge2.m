function [] = merge2( stepSize, numberOfImages, prefix, sampler )
% close all figures

% read the first pcd
current = read_body(0, prefix);

% initialzize rotations accumulated (Rac) and translation accumulated (tac)
Rac = zeros(3, 3, numberOfImages);
tac = zeros(3, 1, numberOfImages);

% start at the zeroth point cloud
i = 0;
RacTacIndex = 0;

% while we have not reached the number of images
while i < numberOfImages
    % increase the previous image with stepsize
    i = i + stepSize 

    % read the new point cloud
    new = read_body(i, prefix);
    
    % for all previous rotations and translations (+ current) transform new
    % by the recorded translation, we do not want this to happen for the
    % first image, hence the RacTacIndex should be > 0.
    if RacTacIndex > 0
        for j = -RacTacIndex:-1
            prevRacTacIndex = abs(j);
            new = Rac(:, :, prevRacTacIndex) * new + repmat(tac(:, :, prevRacTacIndex), 1, size(new, 2));
            %figure
            %plot3(new(1, :), new(2, :), new(3, :), 'go');
        end
    end
    %figure, hold on
    %plot3(current(1,:),current(2,:),current(3,:),'bo');
    %plot3(new(1,:),new(2,:),new(3,:),'ro');

    
    % perform icp between current and new
    [t, R]  = icp(current, new, [0.01, 0.02, 0.03, 0.1], sampler);
    
    % transform new with its own transformation
    new = R * new + repmat(t, 1, size(new, 2));
    
    % append the new set to the current set (merge)
    current = [current, new];

    % increase the RacTacIndex
    RacTacIndex = RacTacIndex + 1;

    % store rotation and translation
    Rac(:, :, RacTacIndex) = R;
    tac(:, :, RacTacIndex) = t;
   
end

% plot
plotSurface(current)

end


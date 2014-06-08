function [ output_args ] = merge1( stepSize, numberOfImages )
close all;
figure;
hold on;

current = read_body(0);

plotSurface(current);

Rac = zeros(3, 3, numberOfImages-1);
tac = zeros(3, 1, numberOfImages-1);

i = 0
RacTacIndex = 1;

while i <= numberOfImages
    i = i + stepSize 

    new = read_body(i);
    [t, R]  = icp(current, new, [0.1, 0.1, 0.2, 0.3, 0.4]);
    current = new;

    %newTransformed = R * new + repmat(t, 1, size(new, 2));

    % Plot the results
    %figure
    %plotSurfaces(current, newTransformed);

    Rac(:, :, RacTacIndex) = R;
    tac(:, :, RacTacIndex) = t;

    for j = -RacTacIndex:-1
        prevRacTacIndex = abs(j);
        new = Rac(:, :, prevRacTacIndex) * new + repmat(tac(:, :, prevRacTacIndex), 1, size(new, 2));
        %figure, plotSurface(new); title(i);
    end
    
    plotSurface(new);

    RacTacIndex = RacTacIndex + 1;

end

hold off;

end


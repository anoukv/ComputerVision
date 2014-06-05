clear()
close all;
% figure;
% hold on;

numOfImages = 35;
current = read_body(0);
plotSurface(current);
Rac = zeros(3, 3, numOfImages-1);
tac = zeros(3, 1, numOfImages-1);

for i=1:numOfImages
    i
    new = read_body(1);
    [t, R]  = icp(current, new, [0.1, 0.2, 0.3, 0.3, 0.3]);
    Rac(:, :, i) = R;
    tac(:, :, i) = t;
    %current = R * new + repmat(t, 1, size(new, 2));    
    %plotSurface(current);
end

for i=1:numOfImages
    i
    data = read_body(i);
    for j = 1:i
        data = Rac(:, :, j) * data + repmat(tac(:, :, j), 1, size(data, 2));
        if i > 10
            figure
            plotSurface(data);
        end
    end
    close all;
%     plotSurface(data);
end

hold off;
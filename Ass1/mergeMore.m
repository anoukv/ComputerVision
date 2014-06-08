clear()
close all;
figure;
hold on;

numOfImages = 35;
start = 1;
current = read_body(start-1);

plotSurface(current);

Rac = zeros(3, 3, numOfImages-1);
tac = zeros(3, 1, numOfImages-1);

for i=start:numOfImages
    i
    new = read_body(i);
    [t, R]  = icp(current, new, [0.02, 0.07, 0.2]);
    current = new;

    Rac(:, :, i) = R;
    tac(:, :, i) = t;
    
    for j = -i:-1
        tada = abs(j);
        new = Rac(:, :, tada) * new + repmat(tac(:, :, tada), 1, size(new, 2));
    end
    
    plotSurface(new);
end

% for i=1:numOfImages
%     i
%     data = read_body(i);
%     
% end

hold off;
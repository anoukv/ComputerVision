clear()
close all;
figure;
hold on;

numOfImages = 20;

current = read_body(0);

plotSurface(current);

Rac = zeros(3, 3, numOfImages-1);
tac = zeros(3, 1, numOfImages-1);

for i=1:numOfImages
    i
    new = read_body(i);
    [t, R]  = icp(current, new, [0.05, 0.1, 0.3]);
    current = new;

    Rac(:, :, i) = R;
    tac(:, :, i) = t;
    
    for j = -i:-1
        tada = abs(j);
        new = Rac(:, :, tada) * new + repmat(tac(:, :, tada), 1, size(new, 2));
    end
    
    plotSurface(new);
end

hold off;
clear()
close all;
figure;
hold on;

% prefix = '/Users/anoukvisser/dev/MATLAB/data1/';
prefix = '/Users/Remi/Desktop/Master/Semester2/CV_data/Ass1/';

numOfImages = 15;

current = read_body(0, prefix);

plotSurface(current);

Rac = zeros(3, 3, numOfImages-1);
tac = zeros(3, 1, numOfImages-1);

for i=1:numOfImages
    i
    new = read_body(i, prefix);
    [t, R]  = icp(current, new, [0.02, 0.07, 0.2], 'uniform');
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
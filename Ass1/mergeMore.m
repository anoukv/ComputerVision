clear()
close all;
figure;
hold on;

current = read_body(0);
plotSurface(current);
for i=1:99
    i
    new = read_body(1);
    [t, R]  = icp(current, new, [0.1, 0.2, 0.3, 0.3, 0.3]);
    current = R * new + repmat(t, 1, size(new, 2));    
    plotSurface(current);
end

hold off;
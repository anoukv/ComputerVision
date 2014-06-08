clear();
target = read_body(0);
base = read_body(10);
%[target, base] = getTwoExampleData();

[t, R] = icp(target, base, [0.001, 0.01, 0.1]);

% Transform data-matrix using ICP result
baseTransformed = R * base + repmat(t, 1, size(base, 2));

% Plot model points blue and transformed points red
figure;
subplot(1,2,1);
plotSurfaces(target, base);

% Plot the results
subplot(1,2,2);
plotSurfaces(target, baseTransformed);

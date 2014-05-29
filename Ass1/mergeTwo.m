clear();

[target, base] = getBodyData();
%[target, base] = getTwoExampleData();

[t, R] = icp(target, base, [0.01, 0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 1, 1, 1, 1]);

% Transform data-matrix using ICP result
baseTransformed = R * base + repmat(t, 1, size(base, 2));

% Plot model points blue and transformed points red
figure;
subplot(1,2,1);
plotSurfaces(target, base);

% Plot the results
subplot(1,2,2);
plotSurfaces(target, baseTransformed);

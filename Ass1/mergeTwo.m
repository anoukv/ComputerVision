clear();

[target, base] = getBodyData();
%[target, base] = getTwoExampleData();

[T, R] = icp(target, base, 10);

% Transform data-matrix using ICP result
baseTransformed = R * base + repmat(T, 1, size(base, 2));

% Plot model points blue and transformed points red
figure;
subplot(1,2,1);
plotSurfaces(target, base);

% Plot the results
subplot(1,2,2);
plotSurfaces(target, baseTransformed);

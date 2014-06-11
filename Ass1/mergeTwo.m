clear();

% prefix = '/Users/anoukvisser/dev/MATLAB/data1/';
prefix = '/Users/Remi/Desktop/Master/Semester2/CV_data/Ass1/';

target = read_body(20, prefix);
base = read_body(25, prefix);
%[target, base] = getTwoExampleData();

[t, R] = icp(target, base, [0.2, 0.2, 0.2, 0.2, 0.2, 1], 'random');

% Transform data-matrix using ICP result
baseTransformed = R * base + repmat(t, 1, size(base, 2));

% Plot model points blue and transformed points red
figure;
subplot(1,2,1);
plotSurfaces(target, base);

% Plot the results
subplot(1,2,2);
plotSurfaces(target, baseTransformed);

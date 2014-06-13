clear();

% prefix = '/Users/anoukvisser/dev/MATLAB/data1/';
prefix = '/Users/Remi/Desktop/Master/Semester2/CV_data/Ass1/';

target = read_body(20, prefix);
base = read_body(25, prefix);
fractions = [0.1, 0.1, 0.1, 0.1, 0.1, 1];

tic;
[~, ~, rms1] = icp(target, base, fractions, 'uniform');
toc;

tic;
[~, ~, rms2] = icp(target, base, fractions, 'random');
toc;

tic;
[~, ~, rms3] = icp(target, base, fractions, 'fn');
toc;


x = 1:size(fractions,2);
figure,
plot(x,rms1, x, rms2, x, rms3);
legend('Uniform', 'Random', 'Nearest Neighbor');
xlabel('iteration#');
ylabel('Root Mean Squared error');
title('RMS error');
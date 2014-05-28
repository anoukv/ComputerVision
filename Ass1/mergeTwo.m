clear()

tic;
if false
    if true
        data1 = cleanup(readPcd('/Users/anoukvisser/dev/MATLAB/data1/0000000000.pcd'));
        data2 = cleanup(readPcd('/Users/anoukvisser/dev/MATLAB/data1/0000000004.pcd'));
    else
        data1 = cleanup(readPcd('/Users/Remi/Desktop/Master/Semester2/CV_data/Ass1/0000000006.pcd'));
        data2 = cleanup(readPcd('/Users/Remi/Desktop/Master/Semester2/CV_data/Ass1/0000000007.pcd'));
    end
else
    [data1, data2] = getTwoExampleData();
end

[R, t] = icpAnouk(data1, data2, [0.01, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8]');

figure;
subplot(1, 2, 1);
plotSurfaces(data1, data2)

data1 = R * data1 + repmat(t, 1, size(data1, 2));

subplot(1, 2, 2);
plotSurfaces(data1, data2)


toc
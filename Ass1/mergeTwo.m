clear()

tic;
if false
    data1 = cleanup(readPcd('/Users/anoukvisser/dev/MATLAB/data/0000000006.pcd'));
    data2 = cleanup(readPcd('/Users/anoukvisser/dev/MATLAB/data/0000000007.pcd'));
else
    data1 = cleanup(readPcd('/Users/Remi/Desktop/Master/Semester2/data/0000000006.pcd'));
    data2 = cleanup(readPcd('/Users/Remi/Desktop/Master/Semester2/data/0000000007.pcd'));
end

figure;
subplot(1, 2, 1);
plot3(data1(1,:),data1(2,:),data1(3,:),'bo',data2(1,:),data2(2,:),data2(3,:),'r.');
axis equal;

[R, t] = icp(data1, data2, 3);

data1 = R * data1 + repmat(t, 1, size(data1, 2));

subplot(1, 2, 2);
plot3(data1(1,:),data1(2,:),data1(3,:),'bo',data2(1,:),data2(2,:),data2(3,:),'r.');
axis equal;

toc
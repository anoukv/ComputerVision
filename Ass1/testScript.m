% based on an ICP demo written by Jakob Wilm
clear; 

[target, base] = getTwoExampleData();

figure;
subplot(1, 2, 1);
plot3(base(1,:),base(2,:),base(3,:),'bo',target(1,:),target(2,:),target(3,:),'r.');
axis equal;

[R, t] = icp(base, target, 15);

base = R * base + repmat(t, 1, size(base, 2));

subplot(1, 2, 2);
plot3(base(1,:),base(2,:),base(3,:),'bo',target(1,:),target(2,:),target(3,:),'r.');
axis equal;


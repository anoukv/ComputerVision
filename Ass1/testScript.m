% based on an ICP demo written by Jakob Wilm

m = 80;
n = m^2; 

[X,Y] = meshgrid(linspace(-2,2,m), linspace(-2,2,m));

X = reshape(X,1,[]);
Y = reshape(Y,1,[]);

Z = sin(X).*cos(Y);

D = [X; Y; Z];

Tx = 0.5;
Ty = -0.3;
Tz = 0.2;

T = [Tx; Ty; Tz];

rx = 0.3;
ry = -0.2;
rz = 0.05;

Rx = [1 0 0;
      0 cos(rx) -sin(rx);
      0 sin(rx) cos(rx)];
  
Ry = [cos(ry) 0 sin(ry);
      0 1 0;
      -sin(ry) 0 cos(ry)];
  
Rz = [cos(rz) -sin(rz) 0;
      sin(rz) cos(rz) 0;
      0 0 1];

R = Rx*Ry*Rz;

M = R * D + repmat(T, 1, n);

rng(2912673);
M = M + 0.01*randn(3,n);
D = D + 0.01*randn(3,n);

figure;
subplot(1, 2, 1);
plot3(M(1,:),M(2,:),M(3,:),'bo',D(1,:),D(2,:),D(3,:),'r.');
axis equal;

[Rown, town] = icp(M, D, 50);
D2 = Rown * D + repmat(town, 1, n);

subplot(1, 2, 2);
plot3(M(1,:),M(2,:),M(3,:),'bo',D2(1,:),D2(2,:),D2(3,:),'r.');
axis equal;
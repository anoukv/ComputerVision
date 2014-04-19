function [ base, target ] = getTwoExampleData()
% based on an ICP demo written by Jakob Wilm
clear; 

m = 80;

[X,Y] = meshgrid(linspace(-2,2,m), linspace(-2,2,m));

X = reshape(X,1,[]);
Y = reshape(Y,1,[]);

Z = sin(X).*cos(Y);

target = [X; Y; Z];

T = [0.5; -0.3; 0.2];

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

RR = Rx*Ry*Rz;

base = RR * target + repmat(T, 1, size(target, 2));

% let's assume perfectness for now
base = base + 0.01*randn(3,size(target, 2));
target = target + 0.01*randn(3,size(target, 2));

end


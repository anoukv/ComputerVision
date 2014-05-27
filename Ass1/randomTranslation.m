function [ data2 ] = randomTranslation( data1 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

T = [rand(1, 1); rand(1, 1); rand(1, 1)];

rx = rand(1, 1);
ry = rand(1, 1);
rz = rand(1, 1);

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

data2 = R * data1 + repmat(T, 1, size(data1, 2));

end


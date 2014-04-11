function [ ] = visualizePCD( pointCloudData )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Only keep points that have the z < 2
pointCloudData = pointCloudData(pointCloudData(:, 3) < 2, :);

scatter3(pointCloudData(:, 1), pointCloudData(:, 2), pointCloudData(:, 3))

end


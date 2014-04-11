function [ ] = visualizePCD( pointCloudData )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

pointCloudData = pointCloudData(pointCloudData(:, 3) < 2, :);
size(pointCloudData)
scatter3(pointCloudData(:, 1), pointCloudData(:, 2), pointCloudData(:, 3))

end


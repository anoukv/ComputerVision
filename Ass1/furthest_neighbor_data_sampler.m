function [ samples ] = furthest_neighbor_data_sampler( data, fraction )
%% TO BE COMMENTED BY REMI

if fraction > 0.98
    samples = data;
else
    % Define sample size
    sample_size = int64(size(data,2) * fraction);

    % Find the xyz min and max borders of the data
    x_min = min(data(1,:));
    y_min = min(data(2,:));
    z_min = min(data(3,:));

    x_max = max(data(1,:));
    y_max = max(data(2,:));
    z_max = max(data(3,:));


    % Take sample_size points and find nearest neighbor.
    samples = zeros(3, sample_size);
    kdtree = vl_kdtreebuild(data);

    for i=1:sample_size
        point = [random_double(x_min, x_max), random_double(y_min, y_max), random_double(z_min, z_max)]';
        [index, ~] = vl_kdtreequery(kdtree, data, point);
        samples(:,i) = data(:,index);
    end
end



function [value] = random_double(min, max)
value = rand();
value = value * (max - min) + min;



